local this = {}

-- use these pages to look up spell effects
-- https://mwse.github.io/MWSE/apis/tes3/?h=script#tes3applymagicsource
-- https://mwse.github.io/MWSE/references/magic-effects/
-- https://mwse.github.io/MWSE/references/attributes/
-- https://mwse.github.io/MWSE/references/skills/

this.divinePrayers = {
    {
        name = "Prayer to Mara",
        id = "prayer_to_mara",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        description = "Pray to Mara to fortify my health.",
        spellEffects = {
            {
                id = 80, --fortifyHealth
                duration = 60,
                min = 50,
                max = 50,
            }
        },
        time = 60,
        text = "Dear Mara, you are awesome.\n\n Isn't modding fun?",
    },
    {
        name = "Prayer to Talos",
        id = "prayer_to_talos",
        handler = "Divine Prayers",
        skillReq = 40,
        skill = "divine",
        description = "Pray to Talos to fortify my strength.",
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 0,
                duration = 60,
                min = 100,
                max = 500,
            }
        },
        time = 60,
        text = "But you were once man! Aye! And as man, you said, 'Let me show you the power of Talos Stormcrown, born of the North, where my breath is long winter.' 'I breathe now, in royalty, and reshape this land which is mine. I do this for you, Red Legions, for I love you.nb1 Aye, love. Love! Even as man, great Talos cherished us. For he saw in us, in each of us, the future of Skyrim! The future of Tamriel! And there it is, friends! The ugly truth! We are the children of man! Talos is the true god of man! Ascended from flesh, to rule the realm of spirit! The very idea is inconceivable to our Elven overlords! Sharing the heavens with us? With man? Ha! They can barely tolerate our presence on earth! Today, they take away your faith. But what of tomorrow? What then? Do the elves take your homes? Your businesses? Your children? Your very lives? And what does the Empire do? Nothing! Nay, worse than nothing! The Imperial machine enforces the will of the Thalmor! Against its own people! So rise up! Rise up, children of the Empire! Rise up, Stormcloaks! Embrace the word of mighty Talos, he who is both man and Divine!",
    }
}

return this