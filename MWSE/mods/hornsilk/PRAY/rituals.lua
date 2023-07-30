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
        skillReq = 10,
        skill = "divine",
        description = "Offer a sword to Talos for a combat blessing.",
        prayerDuration = 10,
        image = "Icons\\PRAY\\art\\talos.dds",
        materials = {
            { material = "longsword", count = 1 },
        },
        spellEffects = {
            {
                id = 117, --fortifyAttack
                duration = 300,
                min = 100,
                max = 100,
            }
        },
        text = "Talos, here's a sword!",
    }
}

return this
