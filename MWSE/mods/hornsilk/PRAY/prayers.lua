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
        text = "Perched on the edge of an endless rhyme\nIn the Gray Maybe, spirits swirl\nMortal Plane takes its first breath\nDivine mercy or dark trickster's death\nTamriel's dance, the spirits' sway.",
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
        text = "To Arkay, the Unending Dancer,\nDeath's embrace, a cosmic answer\nTravel cycles, birth to fall\nUsher souls, heed the call\nIn twilight's realm, secrets unfold\nDiminuendo, mysteries untold\nWith old rites, we bind the chains\nArkay's laws, our power gains.",
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
        text = "Dibella, radiant muse, your allure we embrace\nBeauty's divine essence, a vision to trace\nIn Cyrodiil's embrace, your cults do bloom\nWomen, artists, and passions you consume\nA tapestry of pleasure, healing and art\nTo Dibella's grace, we offer our heart.",
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
        text = "Julianos, master of enigmas profound\nWith words and numbers, your truth is found\nIn scrolls you dwell, the Damned Equation\nA paradox of wisdom, mind's libation\nThrough arts arcane, your secrets unfurl\nKnowledge's keeper, god of the scholar.",
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
        text = "Kynareth, goddess of winds untamed\nIn heavens' embrace, your power proclaimed\nWith rain's sweet song and whispering breeze\nGuide us through skies, with grace and ease\nBy canah's feather, we soar on high\nTo realms unseen, where spirits lie.",
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
        text = "Goddess of Love, Mara divine\nEmbrace us with affection's twine\nGuide us through life's ebb and flow\nWith boundless love\nmay we grow.",
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
        text = "Stendarr, oh apologist of Men\nWhose whispers echo in fen and glen\nWith hammer's weight, he swung the stars\nIn Legions and in moonlit bazaars\nIn mercy's runt, his power lies\nUnraveling truths in twilight skies.",
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
        text = "Talos, Dragon of the North\nYsmir's legacy, a hero-god forth\nScion of Emperors, Earth and Sky,\nShining Hosts protect, never to die\nThrough days of blood and venom, he strode\nUniting Tamriel, an Empire's abode.\nApotheosis granted, among the Divines\nTiber Septim, Talos, forever to shine.",
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
        text = "Zenithar, Provider of our needs\nGrant us success in worthy deeds\nWith honest toil, we shall strive\nIn labor's grace, may we thrive.",
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
