local this = {}

this.name = "good_daedra_theology"
this.fullName = "Good Daedric Theology"
this.specialization = tes3.specialization.magic
this.attribute = tes3.attribute.intelligence
this.icon = "Icons\\PRAY\\almsivi.dds" --TODO
this.sound = "PRAY\\tri_pray.wav" --TODO
this.description = ( --TODO
    "The Tribunal Theology skill determines your knowledge of traditional prayers and rituals of the Tribunal Temple."
)

this.knowledgeRequirement = function() --TODO
    -- bk_Anticipations
    -- bk_varietiesoffaithintheempire

    -- alternatively, join the ashlanders
    return tes3.getFaction("Temple").playerJoined
end

-- materials:
-- candles
-- bonemeal / soul gems / ashes?
-- books?
-- daedric hearts / skin?

this.recipes = {
    -- basic ritual
    {
        name = "Offering to the Three Sisters",
        id = "good_daedra_ritual",
        handler = "Anticipations Rituals",
        skillReq = 10,
        skill = "good_daedra_theology",
        description = "Pray to the Child of Verse and Memory\n\n    Fortify Mysticism 5 - 10",--TODO
        image = "Icons\\PRAY\\V.dds",--TODO
        materials = { { material = "pray_gold", count = 50 } },--TODO
        spellEffects = {--TODO
            {
                id = 83, --fortifySkill
                skill = 14, --mysticism
                duration = 720,
                min = 5,
                max = 10,
            },
        },
        text = "The Three Good Daedra, Boethiah, Azura, and Mephala, recognized the Divinity of the Triune Ancestors (Blessed Be Their Holy Names)"
        --https://en.uesp.net/wiki/Morrowind:The_Anticipations
    },

    -- -- start the quest..?
    -- {
    --     -- boethia ritual 
    -- },
    -- {
    --     -- mephala ritual
    -- },
    -- {
    --     -- azura ritual
    -- },

    -- -- finish the quest or just improve skill
    -- {
    --     -- boethia ritual 
    -- },
    -- {
    --     -- mephala ritual
    -- },
    -- {
    --     -- azura ritual
    -- },

    -- -- finish the quest and improve skill
    -- {
    --     -- boethia prayer 
    -- },
    -- {
    --     -- mephala prayer
    -- },
    -- {
    --     -- azura prayer
    -- },

    -- -- high skill and tribunal skill
    -- {
    --     -- almalexia prayer
    -- },
    -- {
    --     -- vivec prayer
    -- },
    -- {
    --     -- sotha prayer
    -- },
}

return this
