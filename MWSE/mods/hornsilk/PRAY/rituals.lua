local this = {}

-- use these pages to look up spell effects
-- https://mwse.github.io/MWSE/apis/tes3/?h=script#tes3applymagicsource
-- https://mwse.github.io/MWSE/references/magic-effects/
-- https://mwse.github.io/MWSE/references/attributes/
-- https://mwse.github.io/MWSE/references/skills/
-- https://mwse.github.io/MWSE/references/magic-effects-modded/

this.divineRituals = {
    {
        name = "Wings of Akatosh",
        id = "ritual_of_akatosh",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Venerate Akatosh for a blessing of flight.",
        prayerDuration = 30,
        skillProgress = 40,
        image = "Icons\\PRAY\\art\\akatosh_gold.dds",
        materials = {
            { material = "candle", count = 5 },
        },
        spellEffects = {
            {
                id = 10, --levitate
                duration = 300,
                min = 10,
                max = 30,
            },
            {
                id = 83, --fortifySkill
                skill = 14, --mysticism,
                duration = 300,
                min = 10,
                max = 20,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 4, --speed
                duration = 300,
                min = 10,
                max = 20,
            },
        },
        text = "We have suffered, and are diminished, for all time, but the mortal world we have made is glorious, filling our hearts and spirits with hope. Let us teach the Mortal Races to live well, to cherish beauty and honor, and to love one another as we love them.", --https://en.uesp.net/wiki/Morrowind:The_Monomyth
    },
    {
        name = "Rites of Arkay",
        id = "ritual_of_arkay",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Sanctify your body with an offering to Arkay",
        prayerDuration = 30,
        skillProgress = 40,
        image = "Icons\\PRAY\\art\\arkay_gold.dds",
        materials = {
            { material = "pray_empty_soulgem", count = 3 },
            { material = "candle", count = 3 },
        },
        spellEffects = {
            {
                id = 42, --sanctuary
                duration = 300,
                min = 20,
                max = 20,
            },
            {
                id = 83, --fortifySkill
                skill = 17, --unarmored,
                duration = 300,
                min = 10,
                max = 20,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 2, --willpower
                duration = 300,
                min = 10,
                max = 20,
            },
        },
        text = "Blessed are the Bonemen, for they serve without self in spirit forever.\nBlessed are the Mistmen, for they blend in the glory of the transcendent spirit.\nBlessed are the Wrathmen, for they render their rage unto the ages.\nBlessed are the Masters, for they bridge the past and span the future.", --https://en.uesp.net/wiki/Morrowind:Book_of_Life_and_Service
    },
    {
        name = "Brilliant Gem of Beauty",
        id = "ritual_of_dibella",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Adorn yourself in the dazzling glamour of Dibella",
        prayerDuration = 30,
        skillProgress = 40,
        image = "Icons\\PRAY\\art\\dibella_gold.dds",
        materials = {
            { material = "gem", count = 1 },
        },
        spellEffects = {
            {
                id = 68, --reflect
                duration = 300,
                min = 1,
                max = 10,
            },
            {
                id = 83, --fortifySkill
                skill = 13, --conjuration,
                duration = 300,
                min = 10,
                max = 20,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 6, --personality
                duration = 300,
                min = 10,
                max = 20,
            },
        },
        text = "Ah, but the Passion Dancer bids us remember that quality of love is of the essence, not quantity. If the dance transports us, what matter the number of dancers?", --https://en.uesp.net/wiki/Lore:Augustine_Viliane_Answers_Your_Questions
    },
    {
        name = "Secrets of Julianos",
        id = "ritual_of_julianos",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Offer a skull for the ",
        prayerDuration = 30,
        skillProgress = 40,
        image = "Icons\\PRAY\\art\\julianos_gold.dds",
        materials = {
            { material = "skull", count = 1 },
            { material = "candle", count = 3 },
        },
        spellEffects = {
            {
                id = 39, --invisibility
                duration = 300,
            },
            {
                id = 83, --fortifySkill
                skill = 9, --enchant,
                duration = 300,
                min = 10,
                max = 20,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 1, --intelligence
                duration = 300,
                min = 10,
                max = 20,
            },
        },
        text = "A simple spell cast once, no matter how skillfully and no matter how spectacularly, is ephemeral, of the present, what it is and no more", --https://en.uesp.net/wiki/Morrowind:Palla
    },
    {
        name = "Feather of Kynareth",
        id = "ritual_of_kynareth",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Offer a feather to soar upon the winds",
        prayerDuration = 30,
        skillProgress = 40,
        image = "Icons\\PRAY\\art\\kynareth_gold.dds",
        materials = {
            { material = "pray_feather", count = 1 },
            { material = "candle", count = 3 },
        },
        spellEffects = {
            {
                id = 9, --jump
                duration = 300,
                min = 20,
                max = 20,
            },
            {
                id = 83, --fortifySkill
                skill = 8, --athletics,
                duration = 300,
                min = 10,
                max = 20,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 3, --agility
                duration = 300,
                min = 10,
                max = 20,
            },
        },
        text = "Kynareth\nto you we give the sky\nfor what can fly higher than the wind?", --https://en.uesp.net/wiki/Lore:Words_of_Clan_Mother_Ahnissi
    },
    {
        name = "Mara's Blessed Cup",
        id = "ritual_of_mara",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Fill a cup with the healing waters of Mara",
        prayerDuration = 30,
        skillProgress = 40,
        image = "Icons\\PRAY\\art\\mara_gold.dds",
        materials = {
            { material = "cup", count = 1 },
            { material = "restore_health_ingred", count = 5 },
        },
        spellEffects = {
            {
                id = 80, --fortifyHealth
                duration = 300,
                min = 10,
                max = 50,
            },
            {
                id = 83, --fortifySkill
                skill = 15, --restoration,
                duration = 300,
                min = 10,
                max = 20,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 5, --endurance
                duration = 300,
                min = 10,
                max = 20,
            },
        },
        text = "The Goddess Mara recognized their true love and wept at their loss. Not having power over death, she could do nothing to save Shandar, but she knew that she could not let their love die. She reached down from the heavens and picked up Mara and Shandar in her arms, and placed them high in the heavens.", --https://en.uesp.net/wiki/Lore:Mara%27s_Tear
    },
    {
        name = "Mercy of Stendarr",
        id = "ritual_of_stendarr",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Transform a mace into the steadfast fist of Stendarr",
        prayerDuration = 30,
        skillProgress = 40,
        image = "Icons\\PRAY\\art\\stendarr_gold.dds",
        materials = {
            { material = "pray_mace", count = 1 },
            { material = "candle", count = 1 },
        },
        spellEffects = {
            {
                id = 122, --boundMace
                duration = 300,
                min = 20,
                max = 20,
            },
            {
                id = 83, --fortifySkill
                skill = 4, --bluntWeapon,
                duration = 300,
                min = 10,
                max = 20,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 0, --strenth
                duration = 300,
                min = 10,
                max = 20,
            },
        },
        text = "The castle would hold. No matter the forces, the walls of Cascabel Hall would never fail, but that was small consolation.",--https://en.uesp.net/wiki/Morrowind:The_Rear_Guard
    },
    {
        name = "Sword-Meeting of Talos",
        id = "ritual_of_talos",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Offer a sword to Talos for a combat blessing.",
        prayerDuration = 30,
        skillProgress = 40,
        image = "Icons\\PRAY\\art\\talos_gold.dds",
        materials = {
            { material = "pray_longsword", count = 1 },
            { material = "candle", count = 1 },
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
        text = "For thirty-eight years, the Emperor Tiber reigned supreme. It was a lawful, pious, and glorious age, when justice was known to one and all, from serf to sovereign. On Tiber's death, it rained for an entire fortnight as if the land of Tamriel itself was weeping.", --https://en.uesp.net/wiki/Lore:Brief_History_of_the_Empire_v_1
    },
    {
        name = "Investment of Labor",
        id = "ritual_of_zenithar",
        handler = "Divine Rituals",
        skillReq = 20,
        skill = "divine",
        description = "Honor Zenithar with the fruits of your labor, and your hands and tongue will be blessed",
        prayerDuration = 30,
        skillProgress = 40,
        image = "Icons\\PRAY\\art\\zenithar_gold.dds",
        materials = {
            { material = "pray_gold", count = 100 },
        },
        spellEffects = {
            {
                id = 59, --telekinesis
                duration = 300,
                min = 20,
                max = 20,
            },
            {
                id = 83, --fortifySkill
                skill = 25, --speechcraft,
                duration = 300,
                min = 10,
                max = 20,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 7, --luck
                duration = 300,
                min = 10,
                max = 20,
            },
        },
        text = "Each of the Nine represents different aspects of life, and how it should be lived. But the simplest statement of our doctrines is -- help and protect one another. The stronger one is, the wealthier one is, the more one bears responsibility for helping and protecting others.", --https://en.uesp.net/wiki/Lore:For_my_Gods_and_Emperor
    },
}

this.ashlanderRituals = {
    {
        name = "Invocation of Alandro Sul",
        id = "alandro_sul",
        handler = "Ashlander Rituals",
        skillReq = 20,
        skill = "ashlander",
        skillProgress = 40,
        description = "Commune with the whispers of Alandro Sul's spirit.",
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\alandro_sul.dds",
        materials = {
            { material = "pray_ashlander_cuirass", count = 1},
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
                id = 42, --sanctuary
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
            -- {
            --     id = 336, --detectDaedra (Enhanced Detection)
            --     duration = 300,
            --     min = 100,
            --     max = 100,
            -- },
            -- {
            --     id = 338, --detectHumanoid (Enhanced Detection)
            --     duration = 300,
            --     min = 100,
            --     max = 100,
            -- },
            -- {
            --     id = 340, --detectUndead (Enhanced Detection)
            --     duration = 300,
            --     min = 100,
            --     max = 100,
            -- },
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
        skill = "divine",
        description = "Caius taught me a 'ritual'.",
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
