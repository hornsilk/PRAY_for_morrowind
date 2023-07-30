--Get the Crafting Framework API and check that it exists
local CraftingFramework = include("CraftingFramework")
if not CraftingFramework then return end

local prayers = require("hornsilk.PRAY.prayers")


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
            icon = "Icons/PRAY/divine.dds",
            value = 10,
            attribute =  tes3.attribute.personality,
            description = divineDescription,
            specialization = tes3.specialization.magic,
            active = "active"
        }
    )
end
event.register("OtherSkills:Ready", onSkillReady)


-- INITIALISE--
local function registerPrayer(prayerTable)
    local id = prayerTable.id
    local name = prayerTable.name
    local skill = prayerTable.skill
    local skillValue = prayerTable.skillReq
    local description = prayerTable.description
    local category = prayerTable.handler
    local text = prayerTable.text
    local effects = prayerTable.spellEffects
    local bypassResistances = prayerTable.bypassResistances or true
    local castChance = prayerTable.castChance or 100

    local recipe = {
        id = id,
        -- craftableId = "",
        description = description,
        noResult = true,
        materials = {},
        timeTaken = 60,
        knownByDefault = true,
        skillRequirements = {
            { skill = skill, requirement = skillValue }
        },
        category = category,
        name = name,
        uncarryable = true,
        craftCallback = function()
            tes3.messageBox(text)
            tes3.applyMagicSource({
                reference = tes3.player,
                castChance = castChance,
                bypassResistances = bypassResistances,
                name = name,
                effects = effects
            })
        end
        -- soundId = "",
        -- successMessageCallback = "",
        -- previewMesh = "",
        -- previewImage = "",
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
        "under 'Other Skills'. Your skill at theology is " ..
        "based on your Wisdom."
    )
    local function addSideBar(component)
        component.sidebar:createInfo{ text = sideBarDefault}
        local hyperlink = component.sidebar:createCategory("Credits: ")
        hyperlink:createHyperLink{
            text = "Scripting: hornsilk",
            exec = "start https://github.com/hornsilk/PRAY_for_morrowind",
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
