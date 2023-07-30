local this = {}

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
        -- effect = {"trigger divine prayer animation", "fortify strength 100"},
        description = "Pray to Talos to fortify my strength.",
        time = 60
    }
}

return this