--Get the Crafting Framework API and check that it exists
local CraftingFramework = include("CraftingFramework")
if not CraftingFramework then return end

local materials = require("hornsilk.PRAY.materials")
local prayers = require("hornsilk.PRAY.prayers")
local rituals = require("hornsilk.PRAY.rituals")
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
        onePrayerPerDay = true,
        allPrayersShortDuration = false,
        allSkillReqZero = false,
        noMaterialsReqs = false,
        allPrayersKnown = false,
    }
end


--INITIALISE SKILLS--
local skillModule = require("OtherSkills.skillModule")

--REGISTER SKILLS--
--decent place to look for iconshttps://en.uesp.net/wiki/Category:Morrowind-Banner_Images

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
            attribute =  tes3.attribute.willpower,
            description = divineDescription,
            specialization = tes3.specialization.magic,
            active = "active"
        }
    )

    local ashlanderDescription = (
        "The Ashlander Theology skill determines your knowledge of traditional prayers and rituals of the Ashlanders of Morrowind."
    )
    skillModule.registerSkill(
        "ashlander",
        {
            name = "Ashlander Theology",
            icon = "Icons\\PRAY\\ashlander.dds",
            value = 10,
            attribute =  tes3.attribute.endurance,
            description = ashlanderDescription,
            specialization = tes3.specialization.magic,
            active = "active"
        }
    )

    local sixthHouseDescription = (
        "The Sixth House Theology skill determines your knowledge of traditional prayers and rituals of the Tribe Unmourned."
    )
    skillModule.registerSkill(
        "sixthHouse",
        {
            name = "Sixth House Theology",
            icon = "Icons\\PRAY\\sixthHouse.dds",
            value = 10,
            attribute =  tes3.attribute.personality,
            description = sixthHouseDescription,
            specialization = tes3.specialization.magic,
            active = "active"
        }
    )
end
event.register("OtherSkills:Ready", onSkillReady)


--REGISTER MATERIALS--
local function registerMaterials(materialTable)
    CraftingFramework.Material:registerMaterials(materialTable)
end

--REGISTER RECIPIES--
local function registerPrayerOrRitual(recipeTable, type)
    local id = recipeTable.id
    local name = recipeTable.name
    local skill = recipeTable.skill
    local skillValue = recipeTable.skillReq
    local description = recipeTable.description
    local category = recipeTable.handler
    local text = recipeTable.text
    local effects = recipeTable.spellEffects
    local image = recipeTable.image
    local prayerDuration = recipeTable.prayerDuration or 15 --15 in game minutes
    local castChance = recipeTable.castChance or 100
    local skillProgress = recipeTable.skillProgress or 20

    local bypassResistances = recipeTable.bypassResistances
    if bypassResistances == nil then
        bypassResistances = true
    end

    local knowledgeRequirement = recipeTable.knowledgeRequirement --journalIndex
    if knowledgeRequirement == nil then
        if skill == "ashlander" then
            knowledgeRequirement = function()
                return tes3.getJournalIndex{ id = "A2_1_MeetSulMatuul" } >= 44
            end
        end
        if skill == "divine" then
            knowledgeRequirement = function()
                return tes3.getFaction("Imperial Cult").playerJoined
            end
        end
        if skill == "sixthHouse" then
            knowledgeRequirement = function()
                return tes3.getJournalIndex{ id = "A2_2_6thHouse" } > 41
            end
        end
    end

    local materialsReq = {}
    if type == "prayer" then
        materialsReq = {}
    elseif type == "ritual" then
        materialsReq = recipeTable.materials
    end

    local soundPath = "Fx\\envrn\\chant.wav"
    if recipeTable.soundPath then
        soundPath = recipeTable.soundPath
    elseif skill == "divine" then
        soundPath = "PRAY\\marble-church.wav"
    elseif skill == "ashlander" then
        soundPath = "Fx\\envrn\\woodchimes.wav"
    elseif skill == "sixthHouse" then
        soundPath = "Fx\\envrn\\bell1.wav"
    end

    --CONFIG OPTIONS--
    if config.allPrayersShortDuration then prayerDuration = 3 end
    if config.allSkillReqZero then skillValue = 0 end
    if config.noMaterialsReqs then materialsReq = {} end
    if config.allPrayersKnown then
        knowledgeRequirement = function () return true end
    end


    local recipe = {
        id = id,
        -- craftableId = "",
        description = description,
        noResult = true,
        materials = materialsReq,
        knowledgeRequirement = knowledgeRequirement,
        skillRequirements = {
            { skill = skill, requirement = skillValue, maxProgress = skillProgress }
        },
        category = category,
        name = name,
        uncarryable = true,
        soundPath = soundPath,
        previewImage = image,
        -- successMessageCallback = "",
        -- previewMesh = "",

        craftCallback = function()
            tes3.messageBox(text)
            tes3.player.data.lastDayPrayed = tes3.worldController.daysPassed.value
            animation.defaultAnimationBegin()
            timer.start{
                duration = prayerDuration/60, --duration in hours for game timers
                type = timer.game,
                callback = function ()
                    animation.defaultAnimationEnd()
                    tes3.applyMagicSource({
                        reference = tes3.player,
                        castChance = castChance,
                        bypassResistances = bypassResistances,
                        name = name,
                        effects = effects
                    })
                    tes3.playSound({soundPath = "Fx\\inter\\levelUP.wav"})
                end
            }
        end
    }
    return recipe
end

local function registerPrayersAndRituals()
    if not CraftingFramework then
        --ERROR: CraftingFramework not found
        return
    end

    --Create recipe list
    local recipeList = {}
    for _, prayerList in pairs(prayers) do
        for _, prayerTable in pairs(prayerList) do
            local recipe = registerPrayerOrRitual(prayerTable, "prayer")
            table.insert(recipeList, recipe)
        end
    end
    for _, ritualList in pairs(rituals) do
        for _, ritualTable in pairs(ritualList) do
            local recipe = registerPrayerOrRitual(ritualTable, "ritual")
            table.insert(recipeList, recipe)
        end
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
    mwse.log("[PRAY] Registering Materials")
    registerMaterials(materials)
    mwse.log("[PRAY] Registering Prayers and Rituals")
    registerPrayersAndRituals()
end
event.register("initialized", initialised)


---@param e keyDownEventData
local function onKeyDown(e)
    if e.keyCode ~= config.hotKey.keyCode then return end
    if tes3ui.menuMode() then return end

    local prayerAllowed = false
    if config.onePrayerPerDay then
        if tes3.player.data.lastDayPrayed == nil then
            prayerAllowed = true
        elseif tes3.player.data.lastDayPrayed < tes3.worldController.daysPassed.value then
            prayerAllowed = true
        end
    else
        prayerAllowed = true
    end

    if prayerAllowed then
        event.trigger("PRAY:ActivatePrayerMenu")
    else
        tes3.messageBox("Wait until tomorrow to pray again.")
    end
end
event.register(tes3.event.keyDown, onKeyDown)


--MISC CALLBACKS--
--- @param e bookGetTextEventData
local function ashlanderLitCallback(e)
    if CraftingFramework.interop.getRecipe("basic_ancestor_prayer"):isKnown() then return end
    local isAshlanderLit = false
        for bookId, _ in pairs(CraftingFramework.interop.getMaterials("ashlander_lit").ids) do
        if string.lower(e.book.id) == string.lower(bookId) then
            isAshlanderLit = true
            break
        end
    end
    if not isAshlanderLit then return end

    tes3.messageBox("You have gained knowledge of a prayer from this book.\nYou learned an Ashlander Prayer.")
    tes3.playSound({soundPath = "Fx\\inter\\levelUP.wav"})
    tes3.player.data.hasReadAshlanderLit = true
end
event.register(tes3.event.bookGetText, ashlanderLitCallback)


--------------------------------------------
--MCM
--------------------------------------------

local function registerMCM()
    local  sideBarDefault = ( --TODO : update this!
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
            exec = "https://www.deviantart.com/feivelyn",
        }
        hyperlink:createHyperLink{
            text = "Dagoth Art: Brujoloco",
            exec = "https://www.nexusmods.com/morrowind/mods/48576?tab=files",
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

    page:createYesNoButton({
        label = "Limit to one prayer per day",
        description = "By default, the Prayer Menu will not open if you've already crafted a prayer or ritual during this game day.",
        variable = mwse.mcm:createTableVariable({ id = "onePrayerPerDay", table = config }),
    })

    page:createYesNoButton({
        label = "[DEBUG] Set all prayers and rituals to short duration",
        description = "Debug feature, RESTART REQUIRED.",
        variable = mwse.mcm:createTableVariable({ id = "allPrayersShortDuration", table = config }),
    })

    page:createYesNoButton({
        label = "[DEBUG] Set all prayers and rituals skill requirements to zero",
        description = "Debug feature, RESTART REQUIRED.",
        variable = mwse.mcm:createTableVariable({ id = "allSkillReqZero", table = config }),
    })

    page:createYesNoButton({
        label = "[DEBUG] Set all prayers and rituals material requirements to none",
        description = "Debug feature, RESTART REQUIRED.",
        variable = mwse.mcm:createTableVariable({ id = "noMaterialsReqs", table = config }),
    })

    page:createYesNoButton({
        label = "[DEBUG] Set all prayers and rituals knowledge requirements to none",
        description = "Debug feature, RESTART REQUIRED.",
        variable = mwse.mcm:createTableVariable({ id = "allPrayersKnown", table = config }),
    })

    template:register()
end

event.register("modConfigReady", registerMCM)
