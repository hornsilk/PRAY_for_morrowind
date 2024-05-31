local this = {}

this.name = "bad_daedra_theology"
this.fullName = "Four Corners Theology"
this.specialization = tes3.specialization.magic
this.attribute = tes3.attribute.endurance
this.icon = "Icons\\PRAY\\almsivi.dds" --TODO
this.sound = "PRAY\\tri_pray.wav" --TODO
this.description = ( --TODO
    "The Tribunal Theology skill determines your knowledge of traditional prayers and rituals of the Tribunal Temple."
)

this.knowledgeRequirement = function() --TODO, maybe none
    return true
end

-- materials:
-- candles
-- bonemeal / soul gems / ashes?
-- books?
-- daedric hearts / skin?
-- gems

this.recipes = {
    -- basic ritual ??
    -- {
    -- },
       
    -- -- start the quest..?
    -- dagon prayer --all the weaknesses, disintigrates?
    -- Mehrunes Dagon represents the dangerous terrain of Morrowind
    {
        name = "Proving of Mehrunes Dagon",
        id = "dagon_prayer_1",
        handler = "Four Corners Prayers",
        skillReq = 10,
        skill = "bad_daedra_theology",
        description = "Pray to the Child of Verse and Memory\n\n    Fortify Fatigue 5 - 10",--TODO
        image = "Icons\\PRAY\\V.dds",--TODO
        spellEffects = {
            {
                id = 28, --weaknesstoFire
                duration = 1440,
                min = 50,
                max = 100,
            },
            {
                id = 29, --weaknesstoFrost
                duration = 1440,
                min = 50,
                max = 100,
            },
            {
                id = 30, --weaknesstoShock
                duration = 1440,
                min = 50,
                max = 100,
            },
            {
                id = 35, --weaknesstoPoison
                duration = 1440,
                min = 50,
                max = 100,
            },
        },
        text = "Learn by serving.\nBlessed Almsivi, Mercy, Mastery, Mystery."--TODO
        --https://en.uesp.net/wiki/Morrowind:The_Book_of_Dawn_and_Dusk
    },
    --     -- sheo prayer --damage skills..? or maybe damage physical stuff? --or maybe teleport them somewhere bad and drain magic
    -- silence?, mark?, levitate 1?????
    -- Sheogorath tests for mental weakness and tempts Great Houses to treachery
    {
        name = "Proving of Sheogorath",
        id = "sheo_prayer_1",
        handler = "Four Corners Prayers",
        skillReq = 10,
        skill = "bad_daedra_theology",
        description = "Pray to the Child of Verse and Memory\n\n    Fortify Fatigue 5 - 10",--TODO
        image = "Icons\\PRAY\\V.dds",--TODO
        spellEffects = {
            -- these dont seem to work!
            {
                id = 60, --mark
            },
            {
                id = 48, --sound
                duration = 720,
                min = 1,
                max = 100,
            },
            {
                id = 46, --silence
                duration = 720,
                min = 1,
                max = 100,
            },
            {
                id = 10, --levitate
                duration = 720,
                min = 1,
                max = 1,
            },
            {
                id = 19, --drainMagicka
                duration = 720,
                min = 50,
                max = 250,
            },
            {
                id = 61, --recall
            },
        },
        text = "Learn by serving.\nBlessed Almsivi, Mercy, Mastery, Mystery."--TODO
        --https://en.uesp.net/wiki/Morrowind:The_Book_of_Dawn_and_Dusk
    },
    -- malacath prayer --damage health a ton, burden
    -- Malacath tests the Dunmer for strength
    {
        name = "Proving of Malacath",
        id = "malacath_prayer_1",
        handler = "Four Corners Prayers",
        skillReq = 10,
        skill = "bad_daedra_theology",
        description = "Pray to the Child of Verse and Memory\n\n    Fortify Fatigue 5 - 10",--TODO
        image = "Icons\\PRAY\\V.dds",--TODO
        spellEffects = {
            {
                id = 23, --damageHealth
                duration = 1,
                min = 100,
                max = 100,
            },
            {
                id = 7, --burden
                duration = 720,
                min = 100,
                max = 100,
            },
        },
        text = "Learn by serving.\nBlessed Almsivi, Mercy, Mastery, Mystery."--TODO
        --https://en.uesp.net/wiki/Morrowind:The_Book_of_Dawn_and_Dusk
    },
    --     -- molag prayer --damage attributes, disintigrate armor
    -- Molag Bal is a primary source of obstacles for the Dunmer people and their Chimer predecessors. He attempts to upset the Houses' bloodlines or ruin Dunmeri "purity"
    -- vampirism???? maybe just damage health, magicka, stamina, small amount long duration
    {
        name = "Proving of Molag Bal",
        id = "molag_prayer_1",
        handler = "Four Corners Prayers",
        skillReq = 10,
        skill = "bad_daedra_theology",
        description = "Pray to the Child of Verse and Memory\n\n    Fortify Fatigue 5 - 10",--TODO
        image = "Icons\\PRAY\\V.dds",--TODO
        spellEffects = {
            {
                id = 23, --damageHealth
                duration = 720,
                min = 1,
                max = 1,
            },
            {
                id = 24, --damageMagicka
                duration = 720,
                min = 1,
                max = 1,
            },
            {
                id = 25, --damageFatigue
                duration = 720,
                min = 1,
                max = 1,
            },
            {
                id = 37, --disintegrateWeapon
                duration = 720,
                min = 10,
                max = 10,
            },
            {
                id = 38, --disintegrateArmor
                duration = 720,
                min = 10,
                max = 10,
            },
            {
                id = 32, --weaknesstoCommonDisease
                duration = 720,
                min = 100,
                max = 100,
            },
        },
        text = "Learn by serving.\nBlessed Almsivi, Mercy, Mastery, Mystery."--TODO
        --https://en.uesp.net/wiki/Morrowind:The_Book_of_Dawn_and_Dusk
    },

    -- -- improve skill
    -- {
    --     -- dagon ritual 
    -- },
    -- {
    --     -- sheo ritual
    -- },
    -- {
    --     -- malacath ritual
    -- },
    -- {
    --     -- molag ritual
    -- },

    -- -- high skill and tribunal skill
    -- {
    --     -- dagon prayer
    -- },
    -- {
    --     -- sheo prayer
    -- },
    -- {
    --     -- malacath prayer
    -- },
    -- {
    --     -- molag prayer
    -- },
}

return this
