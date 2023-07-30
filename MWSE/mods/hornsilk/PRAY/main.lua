--Get the Crafting Framework API and check that it exists
local CraftingFramework = include("CraftingFramework")
if not CraftingFramework then return end

local prayers = require("hornsilk.PRAY.prayers")
local animation = require("hornsilk.PRAY.animation")


--CONFIG--
local configPath = "PRAY"
local config = mwse.loadConfig(configPath)
if (config == nil) then
	config = {
        logLevel = "INFO",
        hotKey = {
            enabled = true,
            keyCode = tes3.scanCode.p,
        },
    }
end


--INITIALISE SKILLS--
local skillModule = require("OtherSkills.skillModule")

--REGISTER SKILLS--
local function onSkillReady()
    local divineDescription = (
        "The Divine Theology skill determines your knowledge of prayers and rituals of the Divines."
    )

    skillModule.registerSkill(
        "divine",
        {
            name = "Divine Theology",
            icon = "Icons\\PRAY\\divine.dds",
            value = 10,
            lvlCap = 50,
            -- attribute =  tes3.attribute.wisdom,
            description = divineDescription,
            specialization = tes3.specialization.magic,
            active = "active"
        }
    )
end
event.register("OtherSkills:Ready", onSkillReady)


-- REGISTER RECIPIES --
local function registerPrayer(prayerTable)
    local id = prayerTable.id
    local name = prayerTable.name
    local skill = prayerTable.skill
    local skillValue = prayerTable.skillReq
    local description = prayerTable.description
    local category = prayerTable.handler
    local text = prayerTable.text
    local effects = prayerTable.spellEffects
    local image = prayerTable.image
    local prayerDuration = prayerTable.prayerDuration or 3
    local bypassResistances = prayerTable.bypassResistances or true
    local castChance = prayerTable.castChance or 100

    local recipe = {
        id = id,
        -- craftableId = "",
        description = description,
        noResult = true,
        materials = {},
        knownByDefault = true,
        skillRequirements = {
            { skill = skill, requirement = skillValue }
        },
        category = category,
        name = name,
        uncarryable = true,
        soundPath = "PRAY\\marble-church.wav",
        previewImage = image,
        -- successMessageCallback = "",
        -- previewMesh = "",

        craftCallback = function()
            tes3.messageBox(text)
            skillModule.incrementSkill( skill, {progress = 20} )
            animation.divineAnimationBegin()
            timer.start{
                duration = prayerDuration/60, --duration in hours for game timers
                type = timer.game,
                callback = function ()
                    animation.divineAnimationEnd()
                    tes3.applyMagicSource({
                        reference = tes3.player,
                        castChance = castChance,
                        bypassResistances = bypassResistances,
                        name = name,
                        effects = effects
                    })
                end
            }
        end
    }

    return recipe
end

local function registerPrayers()
    mwse.log("Registering prayers for PRAY")
    if not CraftingFramework then
        --ERROR: CraftingFramework not found
        return
    end
    --Create recipe list
    local recipeList = {}
    for _, prayerTable in pairs(prayers.divinePrayers) do
        local recipe = registerPrayer(prayerTable)
        table.insert(recipeList, recipe)
    end

    --Register your MenuActivator
    CraftingFramework.MenuActivator:new{
        id = "PRAY:ActivatePrayerMenu",
        type = "event",
        name = "Prayer Menu",
        recipes = recipeList,
        defaultSort = "skill",
        defaultFilter = "skill",
        defaultShowCategories = true
    }
end

local function initialised()
    mwse.log("Registering Prayers")
    registerPrayers()
end
event.register("initialized", initialised)


---@param e keyDownEventData
local function onKeyDown(e)
    if tes3ui.menuMode() then return end
    if e.keyCode == config.hotKey.keyCode then
        event.trigger("PRAY:ActivatePrayerMenu")
    end
end
event.register(tes3.event.keyDown, onKeyDown, { filter = config.hotKey.keyCode } )

--------------------------------------------
--MCM
--------------------------------------------

local function registerMCM()
    local  sideBarDefault = (
        "PRAY: Prayers, Rituals, And You \n\n" ..
        "PRAY adds Divine Prayers into the game " ..
        "utilising merlord's skill frameworks in MWSE " ..
        "to fully integrate it into the vanilla UI. \n\n" ..
        "Your Divine Theology skill can be found in your stats menu " ..
        "under 'Other Skills'."
    )
    local function addSideBar(component)
        component.sidebar:createInfo{ text = sideBarDefault}
        local hyperlink = component.sidebar:createCategory("Credits: ")
        hyperlink:createHyperLink{
            text = "Scripting: hornsilk",
            exec = "start https://github.com/hornsilk/PRAY_for_morrowind",
        }
        hyperlink:createHyperLink{
            text = "Divines Art: Feivelyn",
        }
    end

    local template = mwse.mcm.createTemplate("PRAY")
    template:saveOnClose(configPath, config)
    local page = template:createSideBarPage{}
    addSideBar(page)

    page:createKeyBinder{
        label = "Hot key",
        description = "The key to activate the prayer menu.",
        variable = mwse.mcm.createTableVariable{ id = "hotKey", table = config },
        allowCombinations = true
    }

    template:register()
end

event.register("modConfigReady", registerMCM)
