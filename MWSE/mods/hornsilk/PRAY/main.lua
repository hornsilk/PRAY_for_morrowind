--INITIALISE SKILLS--
local skillModule = require("OtherSkills.skillModule")

--REGISTER SKILLS--
local function onSkillReady()
    local divineDescription = (
        "The Divine Theology skill determines your knowledge of prayers and rituals of the Divines."
    )

    skillModule.registerSkill(
        "divine",
        {
            name = "Divine Theology",
            icon = "Icons/PRAY/divine.dds",
            value = 10,
            attribute =  tes3.attribute.willpower,
            description = divineDescription,
            specialization = tes3.specialization.magic,
            active = "active"
        }
    )
end
event.register("OtherSkills:Ready", onSkillReady)
