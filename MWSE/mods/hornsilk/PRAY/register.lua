local CraftingFramework = include("CraftingFramework")



local function registerPrayer(name, prayerTable)
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
    mwse.log("registering prayers for PRAY")
    if not CraftingFramework then
        --ERROR: CraftingFramework not found
        return
    end
    --Create recipe list
    local recipeList = {}
    for name, prayerTable in pairs(Prayers.divinePrayers) do
        local recipe = registerPrayer(name, prayerTable)
        table.insert(recipeList, recipe)
    end

    local menuActivator = CraftingFramework.menuActivator.new{
        id = "PRAY:ActivatePrayerMenu",
        type = "event",
        name = "Prayer Menu",
        recipies = recipeList,
        defaultSort = "skill",
        defaultFilter = "skill",
        defaultShowCategories = true
    }
end
-- event.register("Ashfall:ActivateBushcrafting:Registered", registerPrayers)
-- event.register("OtherSkills:Registered", registerPrayers)
-- event.register("[MENU_ACTIVATOR_ID]:Registered", registerPrayers)
event.register("initialized", registerPrayers)


