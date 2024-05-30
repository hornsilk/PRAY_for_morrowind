local this = {}

-- use these pages to look up spell effects
-- https://mwse.github.io/MWSE/apis/tes3/?h=script#tes3applymagicsource
-- https://mwse.github.io/MWSE/references/magic-effects/
-- https://mwse.github.io/MWSE/references/attributes/
-- https://mwse.github.io/MWSE/references/skills/
-- https://mwse.github.io/MWSE/references/magic-effects-modded/


this.miscPrayers = {
    {
        name = "The Gray Maybe",
        id = "luck_prayer",
        handler = "Miscellaneous Prayers",
        skillReq = 5,
        skill = "divine_theology",
        description = "See what luck the day will bring",
        skillProgress = 0,
        prayerDuration = 5,
        image = "Icons\\PRAY\\art\\dice.dds",
        soundPath = "Fx\\magic\\mystC.wav",
        knowledgeRequirement = function()
            return true
        end,
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 7, --luck
                duration = 720,
                min = 0,
                max = 10,
            },
            {
                id = 17, --drainAttribute
                attribute = 7, --luck
                duration = 720,
                min = 0,
                max = 10,
            }
        },
        text = "Man or mer, things begin with the dualism of Anu and His Other.\nThese twin forces go by many names\n\nAnu-Padomay\nAnuiel-Sithis\nAk-El\nSatak-Akel\nIs-Is Not."
    },
    {
        name = "No-h's Prayer",
        id = "noh_prayer",
        handler = "Miscellaneous Prayers",
        skillReq = 5,
        skill = "tribunal_theology",
        description = "Read 'No-h's Picture Book of Wood' aloud",
        skillProgress = 0,
        prayerDuration = 5,
        image = "Icons\\PRAY\\art\\kurt_noh.dds",
        soundPath = "PRAY\\noh_pray.wav",
        knowledgeRequirement = function ()
            return tes3.player.data.hasReadNoh
        end,
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 7, --luck
                duration = 720,
                min = 10,
                max = 20,
            },
            {
                id = 48, --sound
                duration = 720,
                min = 50,
                max = 100,
            },
        },
        text = "Wood is pretty\nWood is nice\nIf one looks good\nI'll make it twice!"
    },
}

return this
