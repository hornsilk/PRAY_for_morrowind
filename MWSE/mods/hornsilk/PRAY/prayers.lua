local this = {}

this.divinePrayers = {
    {
        name = "Prayer to Mara",
        id = "prayer_to_mara",
        handler = "Divine Prayers",
        skillReq = 10,
        skill = "divine",
        effect = {"trigger divine prayer animation", "fortify health 100"},
        description = "Pray to Mara to fortify my health.",
        time = 60
    },
    {
        name = "Prayer to Talos",
        id = "prayer_to_talos",
        handler = "Divine Prayers",
        skillReq = 40,
        skill = "divine",
        effect = {"trigger divine prayer animation", "fortify strength 100"},
        description = "Pray to Talos to fortify my strength.",
        time = 60
    }
}

return this