local this = {}

-- use these pages to look up spell effects
-- https://mwse.github.io/MWSE/apis/tes3/?h=script#tes3applymagicsource
-- https://mwse.github.io/MWSE/references/magic-effects/
-- https://mwse.github.io/MWSE/references/attributes/
-- https://mwse.github.io/MWSE/references/skills/

this.divineRituals = {
    {
        name = "Sword-Meeting of Talos",
        id = "sword_talos",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Offer a sword to Talos for a combat blessing.",
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\talos_gold.dds",
        materials = {
            { material = "longsword", count = 1 },
        },
        spellEffects = {
             {
                id = 41, --light
                duration = 300,
                min = 20,
                max = 20,
            },
            {
                id = 83, --fortifySkill
                skill = 5, --longBlade,
                duration = 300,
                min = 10,
                max = 20,
            },
            {
                id = 117, --fortifyAttack
                duration = 300,
                min = 10,
                max = 20,
            }
        },
        text = "Talos, here's a sword!",
    }
}

this.ashlanderRituals = {
    {
        name = "Invocation of Alandro Sul",
        id = "alandro_sul",
        handler = "Ashlander Rituals",
        knownByDefault = false,
        skillReq = 20,
        skill = "ashlander",
        description = "Commune with the whispers of Alandro Sul's spirit.",
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\alandro_sul.dds",
        materials = {
            { material = "ashlander_cuirass", count = 1},
            { material = "ashlander_lit", count = 1},
            { material = "candle", count = 5 },
        },
        spellEffects = {
            {
                id = 47, --blind
                duration = 300,
                min = 100,
                max = 100,
            },
            {
                id = 64, --detectAnimal
                duration = 300,
                min = 100,
                max = 100,
            },
            {
                id = 65, --detectEnchantment
                duration = 300,
                min = 100,
                max = 100,
            },
            {
                id = 66, --detectKey
                duration = 300,
                min = 100,
                max = 100,
            },
            {
                id = 42, --sanctuary
                duration = 300,
                min = 100,
                max = 100,
            },
        },
        text = "When earth is sundered, and skies choked black\nAnd sleepers serve the seven curses\nTo the hearth there comes a stranger,\nJourneyed far 'neath moon and star",
    }
}

this.miscRituals = {
    {
        name = "Caius's 'Ritual'",
        id = "caius_skooma",
        handler = "Miscellaneous Rituals",
        skillReq = 5,
        skill = "mysticism",
        description = "Caius taught me a 'ritual'.",
        image = "Icons\\PRAY\\art\\caius_skooma.dds",
        knownByDefault = false,
        soundPath = "Fx\\envrn\\undrwatr.wav",
        skillProgress = 1,
        materials = {
            { material = "skooma_pipe", count = 1},
            { material = "moon_sugar", count = 1},
        },
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 0, --strength
                duration = 300,
                min = 20,
                max = 30,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 4, --speed
                duration = 300,
                min = 20,
                max = 30,
            },
            {
                id = 17, --drainAttribute
                attribute = 1, --intelligence
                duration = 300,
                min = 20,
                max = 30,
            },
            {
                id = 17, --drainAttribute
                attribute = 3, --agility
                duration = 300,
                min = 20,
                max = 30,
            },
            {
               id = 43, --nightEye
               duration = 300,
               min = 0,
               max = 50,
            },
            {
               id = 47, --blind
               duration = 300,
               min = 0,
               max = 50,
            },
        },
        text = "'I'm just an old man with a skooma problem.' ~ Caius Cosades",
    }
}

return this
