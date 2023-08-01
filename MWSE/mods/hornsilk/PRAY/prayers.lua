local this = {}

-- use these pages to look up spell effects
-- https://mwse.github.io/MWSE/apis/tes3/?h=script#tes3applymagicsource
-- https://mwse.github.io/MWSE/references/magic-effects/
-- https://mwse.github.io/MWSE/references/attributes/
-- https://mwse.github.io/MWSE/references/skills/
-- https://mwse.github.io/MWSE/references/magic-effects-modded/

this.divinePrayers = {
    {
        name = "Prayer of Akatosh",
        id = "prayer_of_akatosh",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Akatosh to fortify Speed.",
        image = "Icons\\PRAY\\art\\akatosh.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 4, --speed
                duration = 300,
                min = 10,
                max = 10,
            }
        },
        text = "To AKATOSH\n\nwhose Perch from Eternity allowed the Day.",
    },
    {
        name = "Prayer of Arkay",
        id = "prayer_of_arkay",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Arkay to fortify Willpower.",
        image = "Icons\\PRAY\\art\\arkay.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 2, --willpower
                duration = 300,
                min = 10,
                max = 10,
            }
        },
        text = "To ARKAY\n\nwho braves the Diminuendo.",
    },
    {
        name = "Prayer of Dibella",
        id = "prayer_of_dibella",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Dibella to fortify Personality.",
        image = "Icons\\PRAY\\art\\dibella.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 6, --personality
                duration = 300,
                min = 10,
                max = 10,
            }
        },
        text = "To DIBELLA\n\nwho pays Passion in Pleasure.",
    },
    {
        name = "Prayer of Julianos",
        id = "prayer_of_julianos",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Julianos to fortify Intelligence.",
        image = "Icons\\PRAY\\art\\julianos.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 1, --personality
                duration = 300,
                min = 10,
                max = 10,
            }
        },
        text = "To JULIANOS\n\nwho incants the Damned Equation",
    },
    {
        name = "Prayer of Kynareth",
        id = "prayer_of_kynareth",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Kynareth to fortify Agility.",
        image = "Icons\\PRAY\\art\\kynareth.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 3, --agility
                duration = 300,
                min = 10,
                max = 10,
            }
        },
        text = "To KYNARETH\n\nwho returns the Masculine Breath.",
    },
    {
        name = "Prayer of Mara",
        id = "prayer_of_mara",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Mara to fortify Endurance.",
        image = "Icons\\PRAY\\art\\mara.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 5, --endurance
                duration = 300,
                min = 10,
                max = 10,
            }
        },
        text = "To MARA\n\nwho fills the Empty and tends the Home.",
    },
    {
        name = "Prayer of Stendarr",
        id = "prayer_of_stendarr",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Stendarr to fortify Strength.",
        image = "Icons\\PRAY\\art\\stendarr.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 0, --strenth
                duration = 300,
                min = 10,
                max = 10,
            }
        },
        text = "To STENDARR\n\nwho suffers Men to read.",
    },
    {
        name = "Prayer of Talos",
        id = "prayer_of_talos",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Talos to fortify Attack.",
        image = "Icons\\PRAY\\art\\talos.dds",
        spellEffects = {
            {
                id = 117, --fortifyAttack
                duration = 300,
                min = 10,
                max = 10,
            }
        },
        text = "Scion of Emperors, King of Earth and Sky,\nLord of Shining Hosts,\nProtector of Oathman, Feeman and Yeoman,\nGuarantor of Right and Justice,\nBroad Blessing of Thrones and Powers,\nCynosure of Celestial Glory,\nThe Most High Tiber Septim",
    },
    {
        name = "Prayer of Zenithar",
        id = "prayer_of_zenithar",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Zenithar to fortify Luck.",
        image = "Icons\\PRAY\\art\\zenithar.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 7, --luck
                duration = 300,
                min = 10,
                max = 10,
            }
        },
        text = "To ZENITHAR\n\nthe Provider of our Ease.",
    },
}

this.ashlanderPrayers = {
    {
        name = "Acknowledge the Ancestors",
        id = "basic_ancestor_prayer",
        handler = "Ashlander Prayers",
        skillReq = 10,
        skill = "ashlander",
        skillProgress = 10,
        description = "Acknowledge the memories of our ancestors.",
        image = "Icons\\PRAY\\art\\wise_woman.dds",
        knowledgeRequirement = function ()
            return tes3.player.data.hasReadAshlanderLit or tes3.getJournalIndex{ id = "A2_1_MeetSulMatuul" } >= 44
        end,
        spellEffects = {
            {
                id = 106, --summonAncestralGhost
                duration = 100,
            }
        },
        text = "I pray for the herder\nThat whistles to his guar at play."
    },
    {
        name = "Venerate the Ancestors",
        id = "ancestor_prayer",
        handler = "Ashlander Prayers",
        skillReq = 10,
        skill = "ashlander",
        description = "Praise the memories of our ancestors.",
        image = "Icons\\PRAY\\art\\wise_woman.dds",
        spellEffects = {
            {
                id = 106, --summonAncestralGhost
                duration = 300,
            }
        },
        text = "I pray for the herder\nThat whistles to his guar at play.\n\nI pray for the hunter\nThat stalks the white walkers.\n\nI pray for the wise one\nThat seeks under the hill,\n\nAnd the wife who wishes\nFor one last touch of her dead child's hand."
    },
    {
        name = "Wanderer Under Moon-and-Star",
        id = "wanderer_prayer",
        handler = "Ashlander Prayers",
        skillReq = 12,
        skill = "ashlander",
        description = "See in the darkness by the light of Moon-and-Star.",
        image = "Icons\\PRAY\\art\\ashland_scout.dds",
        spellEffects = {
            {
                id = 43, --nightEye
                duration = 300,
                min = 20,
                max = 40,
            }
        },
        text = "Never shall I yield my home and hearth.\n\nAnd from my tears shall spring forth\n\nThe flowers of grassland springs."
    },
    {
        name = "Stride 'Cross the Ash-Wastes",
        id = "feather_prayer",
        handler = "Ashlander Prayers",
        skillReq = 14,
        skill = "ashlander",
        description = "Travel light and quietly.",
        image = "Icons\\PRAY\\art\\ashland_vista.dds",
        spellEffects = {
            {
                id = 8, --feather
                duration = 300,
                min = 10,
                max = 30,
            },
            {
                id = 83, --fortifySkill 
                skill = 19, --sneak
                duration = 300,
                min = 10,
                max = 30,
            }
        },
        text = "May I shrink to dust\n\nIn your cold, wild Wastes,\n\nAnd may my tongue speak\n\nIts last hymn to your winds."
    },
    {
        name = "Prayer of the Ashkhan",
        id = "ashkhan_prayer",
        handler = "Ashlander Prayers",
        skillReq = 18,
        skill = "ashlander",
        description = "Gird yourself in mystic armors.",
        image = "Icons\\PRAY\\art\\red_mountain.dds",
        spellEffects = {
            {
                id = 3, --shield
                duration = 300,
                min = 10,
                max = 30,
            },
            {
                id = 48, --sound
                duration = 300,
                min = 10,
                max = 30,
            },
            {
                id = 59, --telekinesis 
                duration = 300,
                min = 5,
                max = 15,
            }
        },
        text = "Rise from darkness, Red Mountain!\nSpread your dark clouds and green vapors!\nBirth earthquakes, shatter stones!\nFeed the winds with fire!\nFlay the tents of the tribes from the land!\nFeed the burned earth with our souls!\n\nYet never shall you have your rule over me."
    },
}

this.miscPrayers = {
    {
        name = "The Gray Maybe",
        id = "luck_prayer",
        handler = "Miscellaneous Prayers",
        skillReq = 5,
        skill = "divine",
        description = "See what luck the day will bring.",
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
                duration = 300,
                min = 0,
                max = 10,
            },
            {
                id = 17, --drainAttribute
                attribute = 7, --luck
                duration = 300,
                min = 0,
                max = 10,
            }
        },
        text = "Man or mer, things begin with the dualism of Anu and His Other.\nThese twin forces go by many names\n\nAnu-Padomay\nAnuiel-Sithis\nAk-El\nSatak-Akel\nIs-Is Not."
    },
}

return this
