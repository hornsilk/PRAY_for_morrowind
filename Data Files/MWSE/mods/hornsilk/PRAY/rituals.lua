local this = {}


-- use these pages to look up spell effects
-- https://mwse.github.io/MWSE/apis/tes3/?h=script#tes3applymagicsource
-- https://mwse.github.io/MWSE/references/magic-effects/
-- https://mwse.github.io/MWSE/references/attributes/
-- https://mwse.github.io/MWSE/references/skills/
-- https://mwse.github.io/MWSE/references/magic-effects-modded/


this.miscRituals = {
    {
        name = "Caius's 'Ritual'",
        id = "caius_skooma",
        handler = "Miscellaneous Rituals",
        skillReq = 5,
        skill = "divine_theology",
        description = "Caius taught me a 'ritual'",
        image = "Icons\\PRAY\\art\\caius_skooma.dds",
        knowledgeRequirement = function()
            return tes3.getJournalIndex{ id = "A1_1_FindSpymaster" } >= 11
        end,
        soundPath = "Fx\\envrn\\undrwatr.wav",
        skillProgress = 0,
        materials = {
            { material = "skooma_pipe", count = 1},
            { material = "pray_moon_sugar", count = 1},
        },
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 0, --strength
                duration = 720,
                min = 20,
                max = 30,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 4, --speed
                duration = 720,
                min = 20,
                max = 30,
            },
            {
                id = 17, --drainAttribute
                attribute = 1, --intelligence
                duration = 720,
                min = 20,
                max = 30,
            },
            {
                id = 17, --drainAttribute
                attribute = 3, --agility
                duration = 720,
                min = 20,
                max = 30,
            },
            {
               id = 43, --nightEye
               duration = 720,
               min = 0,
               max = 50,
            },
            {
               id = 47, --blind
               duration = 720,
               min = 0,
               max = 50,
            },
        },
        text = "'I'm just an old man with a skooma problem.' ~ Caius Cosades",
    }
}

return this
