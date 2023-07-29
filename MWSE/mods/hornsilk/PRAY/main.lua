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
            attribute =  tes3.attribute.willpower,
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
    local skill = prayerTable.skill
    local skillValue = prayerTable.skillReq
    local effect = prayerTable.effect
    local description = prayerTable.description
    local category = prayerTable.handler

    local recipe = {
        id = id,
        description = description,
        skillRequirements = {
            { skill = skill, requirement = skillValue }
        },
        category = category,
        noResult = true,
        knownByDefault = true,
        craftCallback = effect
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

    local menuActivator = CraftingFramework.menuActivator:new{
        id = "PRAY:ActivatePrayerMenu",
        type = "event",
        name = "Prayer Menu",
        recipies = recipeList,
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


-- INITIALISE--
local function registerPrayer(prayerTable)
    local id = prayerTable.id
    local skill = prayerTable.skill
    local skillValue = prayerTable.skillReq
    local effect = prayerTable.effect
    local description = prayerTable.description
    local category = prayerTable.handler

    local recipe = {
        id = id,
        description = description,
        skillRequirements = {
            { skill = skill, requirement = skillValue }
        },
        category = category,
        noResult = true,
        knownByDefault = true,
        craftCallback = effect
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

    CraftingFramework.menuActivator:new{
        id = "PRAY:ActivatePrayerMenu",
        type = "event",
        name = "Prayer Menu",
        recipies = recipeList,
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
