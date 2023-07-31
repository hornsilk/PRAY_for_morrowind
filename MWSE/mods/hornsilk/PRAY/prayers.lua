local this = {}

-- use these pages to look up spell effects
-- https://mwse.github.io/MWSE/apis/tes3/?h=script#tes3applymagicsource
-- https://mwse.github.io/MWSE/references/magic-effects/
-- https://mwse.github.io/MWSE/references/attributes/
-- https://mwse.github.io/MWSE/references/skills/

this.divinePrayers = {
    {
        name = "Prayer of Akatosh",
        id = "prayer_of_akatosh",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Akatosh to fortify Speed.",
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\akatosh.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 4, --speed
                duration = 300,
                min = 5,
                max = 5,
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
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\arkay.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 2, --willpower
                duration = 300,
                min = 5,
                max = 5,
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
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\dibella.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 6, --personality
                duration = 300,
                min = 5,
                max = 5,
            }
        },
        text = "To DIBELLA\n\nwho pays Men in Moans.",
    },
    {
        name = "Prayer of Julianos",
        id = "prayer_of_julianos",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Julianos to fortify Intelligence.",
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\julianos.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 1, --personality
                duration = 300,
                min = 5,
                max = 5,
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
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\kynareth.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 3, --agility
                duration = 300,
                min = 5,
                max = 5,
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
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\mara.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 5, --endurance
                duration = 300,
                min = 5,
                max = 5,
            }
        },
        text = "To MARA\n\nwho fills the Empty and drains the Stones.",
    },
    {
        name = "Prayer of Stendarr",
        id = "prayer_of_stendarr",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Stendarr to fortify Strength.",
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\stendarr.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 0, --strenth
                duration = 300,
                min = 5,
                max = 5,
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
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\talos.dds",
        spellEffects = {
            {
                id = 117, --fortifyAttack
                duration = 300,
                min = 5,
                max = 5,
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
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\zenithar.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 7, --luck
                duration = 300,
                min = 5,
                max = 5,
            }
        },
        text = "To ZENITHAR\n\nthe Provider of our Ease.",
    },
}

this.ashlanderPrayers = {
    {
        name = "Ancestor Veneration",
        id = "ancestor_prayer",
        handler = "Ashlander Prayers",
        skillReq = 10,
        skill = "ashlander",
        description = "Remember the memories of our ancestors.",
        prayerDuration = 30,
        image = "Icons\\PRAY\\art\\ashland_ancestor.dds",
        spellEffects = {
            {
                id = 106, --summonAncestralGhost
                duration = 300,
            }
        },
        text = "I pray for the herder\nThat whistles to his guar at play.\n\nI pray for the hunter\nThat stalks the white walkers.\n\nI pray for the wise one\nThat seeks under the hill,\n\n\nAnd the wife who wishes\nFor one last touch of her dead child's hand."
    },
}

return this
