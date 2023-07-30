local this = {}

-- use these pages to look up spell effects
-- https://mwse.github.io/MWSE/apis/tes3/?h=script#tes3applymagicsource
-- https://mwse.github.io/MWSE/references/magic-effects/
-- https://mwse.github.io/MWSE/references/attributes/
-- https://mwse.github.io/MWSE/references/skills/

this.divinePrayers = {
    {
        name = "Prayer to Akatosh",
        id = "prayer_to_akatosh",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Akatosh to fortify Speed.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\akatosh.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 4, --speed
                duration = 60,
                min = 10,
                max = 10,
            }
        },
        text = "Dear Akatosh, you are awesome.\n\n Isn't modding fun?",
    },
    {
        name = "Prayer to Arkay",
        id = "prayer_to_arkay",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Arkay to fortify Willpower.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\arkay.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 2, --willpower
                duration = 60,
                min = 10,
                max = 10,
            }
        },
        text = "Dear Arkay, you are awesome.\n\n Isn't modding fun?",
    },
    {
        name = "Prayer to Dibella",
        id = "prayer_to_dibella",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Dibella to fortify Personality.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\dibella.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 6, --personality
                duration = 60,
                min = 10,
                max = 10,
            }
        },
        text = "Dear Dibella, you are awesome.\n\n Isn't modding fun?",
    },
    {
        name = "Prayer to Julianos",
        id = "prayer_to_julianos",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Julianos to fortify Intelligence.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\dibella.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 1, --personality
                duration = 60,
                min = 10,
                max = 10,
            }
        },
        text = "Dear Julianos, you are awesome.\n\n Isn't modding fun?",
    },
    {
        name = "Prayer to Kynareth",
        id = "prayer_to_kynareth",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Kynareth to fortify Agility.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\kynareth.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 3, --agility
                duration = 60,
                min = 10,
                max = 10,
            }
        },
        text = "Dear Kynareth, you are awesome.\n\n Isn't modding fun?",
    },
    {
        name = "Prayer to Mara",
        id = "prayer_to_mara",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Mara to fortify Endurance.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\mara.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 5, --endurance
                duration = 60,
                min = 10,
                max = 10,
            }
        },
        text = "Dear Mara, you are awesome.\n\n Isn't modding fun?",
    },
    {
        name = "Prayer to Stendarr",
        id = "prayer_to_stendarr",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Stendarr to fortify Strength.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\stendarr.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 0, --strenth
                duration = 60,
                min = 10,
                max = 10,
            }
        },
        text = "Dear Stendarr, you are awesome.\n\n Isn't modding fun?",
    },
    {
        name = "Prayer to Talos",
        id = "prayer_to_talos",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Talos to fortify Attack.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\talos.dds",
        spellEffects = {
            {
                id = 117, --fortifyAttack
                duration = 60,
                min = 10,
                max = 10,
            }
        },
        text = "But you were once man! Aye! And as man, you said, 'Let me show you the power of Talos Stormcrown, born of the North, where my breath is long winter.' 'I breathe now, in royalty, and reshape this land which is mine. I do this for you, Red Legions, for I love you.nb1 Aye, love. Love! Even as man, great Talos cherished us. For he saw in us, in each of us, the future of Skyrim! The future of Tamriel! And there it is, friends! The ugly truth! We are the children of man! Talos is the true god of man! Ascended from flesh, to rule the realm of spirit! The very idea is inconceivable to our Elven overlords! Sharing the heavens with us? With man? Ha! They can barely tolerate our presence on earth! Today, they take away your faith. But what of tomorrow? What then? Do the elves take your homes? Your businesses? Your children? Your very lives? And what does the Empire do? Nothing! Nay, worse than nothing! The Imperial machine enforces the will of the Thalmor! Against its own people! So rise up! Rise up, children of the Empire! Rise up, Stormcloaks! Embrace the word of mighty Talos, he who is both man and Divine!",
    },
    {
        name = "Prayer to Zenithar",
        id = "prayer_to_zenithar",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Zenithar to fortify Luck.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\zenithar.dds",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 7, --luck
                duration = 60,
                min = 10,
                max = 10,
    }
        },
        text = "Dear Zenithar, you are awesome.\n\n Isn't modding fun?",
    },
}

return this