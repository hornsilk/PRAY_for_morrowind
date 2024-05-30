local this = {}

local skillModule = require("OtherSkills.skillModule")


-- use these pages to look up spell effects
-- https://mwse.github.io/MWSE/apis/tes3/?h=script#tes3applymagicsource
-- https://mwse.github.io/MWSE/references/magic-effects/
-- https://mwse.github.io/MWSE/references/attributes/
-- https://mwse.github.io/MWSE/references/skills/
-- https://mwse.github.io/MWSE/references/magic-effects-modded/



this.tribunalRituals = {
    {
        name = "Prostration Towards Vivec",
        id = "vivec_donation_ritual",
        handler = "Tribunal Rituals",
        skillReq = 10,
        skill = "tribunal_theology",
        description = "Pray to the Child of Verse and Memory\n\n    Fortify Fatigue 5 - 10",
        image = "Icons\\PRAY\\V.dds",
        materials = { { material = "pray_gold", count = 50 } },
        spellEffects = {
            {
                id = 82, --fortifyFatigue
                duration = 720,
                min = 5,
                max = 10,
            },
        },
        text = "Learn by serving.\nBlessed Almsivi, Mercy, Mastery, Mystery."--https://en.uesp.net/wiki/Morrowind:The_Book_of_Dawn_and_Dusk
    },
    {
        name = "Prostration Towards Almalexia",
        id = "alma_donation_ritual",
        handler = "Tribunal Rituals",
        skillReq = 10,
        skill = "tribunal_theology",
        description = "Pray to Mother Morrowind\n\n    Fortify Health 5 - 10",
        image = "Icons\\PRAY\\A.dds",
        materials = { { material = "pray_gold", count = 50 } },
        spellEffects = {
            {
                id = 80, --fortifyHealth
                duration = 720,
                min = 5,
                max = 10,
            },
        },
        text = "From the heart, the light; from the head, the law.\nBlessed Almsivi, Mercy, Mastery, Mystery."--https://en.uesp.net/wiki/Morrowind:The_Book_of_Dawn_and_Dusk
    },
    {
        name = "Prostration Towards Sotha Sil",
        id = "sotha_donation_ritual",
        handler = "Tribunal Rituals",
        skillReq = 10,
        skill = "tribunal_theology",
        description = "Pray to the Father of Mysteries\n\n    Fortify Magicka 5 - 10",
        image = "Icons\\PRAY\\S.dds",
        materials = { { material = "pray_gold", count = 50 } },
        spellEffects = {
            {
                id = 81, --fortifyMagicka
                duration = 720,
                min = 5,
                max = 10,
            },
        },
        text = "Refuse neither brother nor ghost.\nBlessed Almsivi, Mercy, Mastery, Mystery." --https://en.uesp.net/wiki/Morrowind:The_Book_of_Dawn_and_Dusk
    },
    {
        name = "Saint Aralor's Intervention",
        id = "aralor_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Aralor.\n\n    Cure Common Disease\n    Fortify Personality 5 - 15",
        image = "Icons\\PRAY\\art\\aralor.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 6, --personality
                duration = 720,
                min = 5,
                max = 15,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn self-respect and respect for others, follow Saint Aralor the Penitent, Patron of Tanners and Miners. This foul criminal repented his sins and traveled a circuit of the great pilgrimages on his knees."
    },
    {
        name = "Saint Delyn's Shield",
        id = "delyn_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Delyn\n\n    Cure Common Disease\n    Resist Blight Disease 10 - 50",
        image = "Icons\\PRAY\\art\\delyn.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 95, --resistBlightDisease
                duration = 720,
                min = 10,
                max = 30,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn benevolence, follow Saint Delyn the Wise, Patron of Potters and Glassmakers. Saint Delyn was head of House Indoril, a skilled lawyer, and author of many learned treatises on Tribunal law and custom."
    },
    {
        name = "Saint Felms's Glory",
        id = "felms_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Felms\n\n    Cure Common Disease\n    Fortify Restoration 5 - 15",
        image = "Icons\\PRAY\\art\\felms.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 83, --fortifySkill 
                skill = 15, --restoration
                duration = 720,
                min = 5,
                max = 15,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn fierce justice, follow Saint Felms the Bold, Patron of Butchers and Fishmongers. This brave warlord slew the Nord invaders and drove them from our lands. He could neither read nor write, receiving inspiration directly from the lips of Almsivi."
    },
    {
        name = "Saint Llothis's Rock",
        id = "llothis_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Llothis\n\n    Cure Common Disease\n    Fortify Willpower 5 - 15",
        image = "Icons\\PRAY\\art\\llothis.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 2, --willpower
                duration = 720,
                min = 5,
                max = 15,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn reverence, follow Saint Llothis the Pious, Patron of Tailors and Dyers. Contemporary and companion of the Tribunal, and the best-loved Alma Rula of the Tribunal Temple, he formulated the central rituals and principles of the New Temple Faith. Saint Llothis is the symbolic mortal bridge between the gods and the faithful, and the archetypal priest."
    },
    {
        name = "Saint Meris's Warding",
        id = "meris_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Meris\n\n    Cure Common Disease\n    Resist Corprus Disease 20 - 50",
        image = "Icons\\PRAY\\art\\meris.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 96, --resistCorprusDisease
                duration = 720,
                min = 20,
                max = 60,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn the love of peace, follow Saint Meris the Peacemaker, Patron of Farmers and Laborers. As a little girl, Saint Meris showed healing gifts, and trained as a Healer. She ended a long and bloody House War, intervening on the battlefield in her white robe to heal warriors and spellcrafters without regard to faction."
    },
    {
        name = "Saint Nerevar's Spirit",
        id = "nerevar_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Nerevar\n\n    Cure Common Disease\n    Fortify Fatigue 20 - 60",
        image = "Icons\\PRAY\\art\\nerevar.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 82, --fortifyFatigue
                duration = 720,
                min = 20,
                max = 60,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn valor, follow St. Nerevar the Captain, patron of Warriors and Statesmen. Lord Nerevar helped to unite the barbarian Dunmer tribes into a great nation, culminating in his martyrdom when leading the Dunmer to victory against the evil Dwemer and the traitorous House Dagoth in the Battle of Red Mountain."
    },
    {
        name = "Saint Olms's Benediction",
        id = "olms_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Olms\n\n    Cure Common Disease\n    Resist Common Disease 20 - 60",
        image = "Icons\\PRAY\\art\\olms.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 94, --resistCommonDisease
                duration = 720,
                min = 20,
                max = 60,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn the rule of law and justice, follow Saint Olms the Just, Patron of Chandlers and Clerks. Founder of the Ordinators, Saint Olms conceived and articulated the fundamental principles of testing, ordeal, and repentance."
    },
    {
        name = "Saint Rilms's Grace",
        id = "rilm_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Rilms\n\n    Cure Common Disease\n    Fortify Endurance 5 - 15",
        image = "Icons\\PRAY\\art\\rilms.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 5, --endurance
                duration = 720,
                min = 5,
                max = 15,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn generosity, follow Saint Rilms the Barefooted, Patron of Pilgrims and Beggars. Saint Rilms gave away her shoes, then dressed and appeared as a beggar to better acquaint herself with the poor."
    },
    {
        name = "Saint Roris's Bloom",
        id = "roris_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Roris\n\n    Cure Common Disease\n    Fortify Health 5 - 15",
        image = "Icons\\PRAY\\art\\roris.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 80, --fortifyHealth
                duration = 720,
                min = 5,
                max = 15,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn pride of race and tribe, follow Saint Roris the Martyr, Patron of Furnishers and Caravaners. Captured by Argonians just before the Arnesian War, Roris proudly refused to renounce the Tribunal faith, and withstood the cruel tortures of Argonian sorcerers. Vengeance and justice for the martyred Saint Roris was the rallying cry of the Arnesian War."
    },
    {
        name = "Saint Seryn's Shield",
        id = "seryn_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Seryn\n\n    Cure Common Disease\n    Resist Poison 20 - 60",
        image = "Icons\\PRAY\\art\\seryn.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 97, --resistPoison
                duration = 720,
                min = 20,
                max = 60,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn mercy and its fruits, follow Saint Seryn the Merciful, Patron of Brewers, Bakers, Distillers. This pure virgin of modest aspect could heal all diseases at the price of taking the disease upon herself. Tough-minded and fearless, she took on the burdens of others, and bore those burdens to an honored old age."
    },
    {
        name = "Saint Veloth's Indwelling",
        id = "veloth_ritual",
        handler = "Tribunal Rituals",
        skillReq = 20,
        skill = "tribunal_theology",
        description = "Purge yourself of disease and study the virtures of Saint Veloth\n\n    Cure Common Disease\n    Fortify Magicka 10 - 30",
        image = "Icons\\PRAY\\art\\veloth.dds",
        materials = { { material = "candle", count = 1 } },
        spellEffects = {
            {
                id = 81, --fortifyMagicka
                duration = 720,
                min = 10,
                max = 30,
            },
            {
                id = 69, --cureCommonDisease
            },
        },
        text = "If you would learn daring, follow Saint Veloth the Pilgrim, Patron of Outcasts and Spiritual Seekers. Saint Veloth, prophet and mystic, led the Dunmer out of the decadent home country of the Summerset Isles and into the promised land of Morrowind. Saint Veloth also taught the difference between the Good and Bad Daedra, and won the aid of the Good Daedra for his people while teaching how to carefully negotiate with the Bad Daedra."
    },
}

local ashlanderModule = require("hornsilk.PRAY.theologies.ashlander")
this.ashlanderRituals = ashlanderModule.rituals
local divineModule = require("hornsilk.PRAY.theologies.divine")
this.divineRituals = divineModule.rituals

this.sixthHouseRituals = {
    {
        name = "First Word of the Dreamer",
        id = "sixthHouse_ritual_1",
        handler = "Sixth House Rituals",
        skillReq = 10,
        skill = "sixth_house_theology",
        description = "How will you honor the Sixth House, the tribe unmourned?",
        image = "Icons\\PRAY\\art\\dagoth1.dds",
        skillProgress = 200,
        materials = {
            { material = "ash_statue", count = 1 }
        },
        knowledgeRequirement = function()
            return tes3.getJournalIndex{ id = "A2_2_6thHouse" } > 41 and skillModule.getSkill('sixth_house_theology').value < 11
        end,
        spellEffects = {
            {
                id = 17, --drainAttribute
                attribute = 6, --personality
                duration = 720,
                min = 10,
                max = 10,
            },
        },
        text = "He is the Lord, and Father of the Mountain."
    },
    {
        name = "Second Word of the Dreamer",
        id = "sixthHouse_ritual_2",
        handler = "Sixth House Rituals",
        skillReq = 11,
        skill = "sixth_house_theology",
        description = "How will you honor the Sixth House, the tribe unmourned?",
        image = "Icons\\PRAY\\art\\dagoth2.dds",
        skillProgress = 200,
        materials = {
            { material = "ash_statue", count = 1 },
            { material = "corprusmeat", count = 3 },
        },
        spellEffects = {
            {
                id = 17, --drainAttribute
                attribute = 6, --personality
                duration = 720,
                min = 20,
                max = 20,
            },
        },
        knowledgeRequirement = function()
            return tes3.getJournalIndex{ id = "A2_2_6thHouse" } > 41 and skillModule.getSkill('sixth_house_theology').value < 12
        end,
        text = "He is the Lord, and Father of the Mountain.\nHe wakes, and the land wakes with him."
    },
    {
        name = "Third Word of the Dreamer",
        id = "sixthHouse_ritual_3",
        handler = "Sixth House Rituals",
        skillReq = 12,
        skill = "sixth_house_theology",
        description = "How will you honor the Sixth House, the tribe unmourned? Together we shall speak for the Law and the Land, and shall drive the mongrel dogs of the Empire from Morrowind.",
        image = "Icons\\PRAY\\art\\dagoth3.dds",
        skillProgress = 200,
        materials = {
            { material = "ash_statue", count = 2 },
            { material = "corprusmeat", count = 5 },
        },
        knowledgeRequirement = function()
            return tes3.getJournalIndex{ id = "A2_2_6thHouse" } > 41 and skillModule.getSkill('sixth_house_theology').value < 13
        end,
        spellEffects = {
            {
                id = 17, --drainAttribute
                attribute = 6, --personality
                duration = 720,
                min = 30,
                max = 30,
            },
        },
        text = "He is the Lord, and Father of the Mountain.\nHe wakes, and the land wakes with him.\nAll the land, and all of its people, shall rise from sleep, and sweep the land clean of the n'wah."
    },
    {
        name = "Forth Word of the Dreamer",
        id = "sixthHouse_ritual_4",
        handler = "Sixth House Rituals",
        skillReq = 13,
        skill = "sixth_house_theology",
        description = "How will you honor the Sixth House, the tribe unmourned? Together we shall speak for the Law and the Land, and shall drive the mongrel dogs of the Empire from Morrowind.",
        image = "Icons\\PRAY\\art\\dagoth4.dds",
        skillProgress = 200,
        materials = {
            { material = "ash_statue", count = 3 },
            { material = "corprusmeat", count = 11 },
        },
        knowledgeRequirement = function()
            return tes3.getJournalIndex{ id = "A2_2_6thHouse" } > 41 and skillModule.getSkill('sixth_house_theology').value < 14
        end,
        spellEffects = {
            {
                id = 17, --drainAttribute
                attribute = 6, --personality
                duration = 720,
                min = 40,
                max = 40,
            },
        },
        text = "He is the Lord, and Father of the Mountain.\nHe wakes, and the land wakes with him.\nAll the land, and all of its people, shall rise from sleep, and sweep the land clean of the n'wah.\nWhy have you denied him?"
    },
    {
        name = "Fifth Word of the Dreamer",
        id = "sixthHouse_ritual_5",
        handler = "Sixth House Rituals",
        skillReq = 14,
        skill = "sixth_house_theology",
        description = "How will you honor the Sixth House, the tribe unmourned? Together we shall speak for the Law and the Land, and shall drive the mongrel dogs of the Empire from Morrowind.\nCome to me, through fire and war. I welcome you.",
        image = "Icons\\PRAY\\art\\dagoth5.dds",
        skillProgress = 200,
        materials = {
            { material = "ash_statue", count = 4 },
            { material = "corprusmeat", count = 19 },
        },
        spellEffects = {
            {
                id = 17, --drainAttribute
                attribute = 6, --personality
                duration = 720,
                min = 50,
                max = 50,
            },
        },
        knowledgeRequirement = function()
            return tes3.getJournalIndex{ id = "A2_2_6thHouse" } > 41 and skillModule.getSkill('sixth_house_theology').value < 15
        end,
        text = "He is the Lord, and Father of the Mountain.\nHe wakes, and the land wakes with him.\nAll the land, and all of its people, shall rise from sleep, and sweep the land clean of the n'wah.\nWhy have you denied him?\nAs Lord Dagoth has said. All shall greet him as flesh, or as dust."
    },
    {
        name = "Final Word of the Dreamer",
        id = "sixthHouse_ritual_6",
        handler = "Sixth House Rituals",
        skillReq = 15,
        skill = "sixth_house_theology",
        description = "How will you honor the Sixth House, the tribe unmourned? Together we shall speak for the Law and the Land, and shall drive the mongrel dogs of the Empire from Morrowind.\nCome to me, through fire and war. I welcome you.\nWelcome, Moon-and-Star. I have prepared a place for you.",
        image = "Icons\\PRAY\\art\\dagoth6.dds",
        skillProgress = 200,
        materials = {
            { material = "ash_statue", count = 6 },
            { material = "corprusmeat", count = 36 },
            { material = "pray_6th_house", count = 1 },
        },
        knowledgeRequirement = function()
            return tes3.getJournalIndex{ id = "A2_2_6thHouse" } > 41 and skillModule.getSkill('sixth_house_theology').value < 16
        end,
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 6, --personality
                duration = 720,
                min = 60,
                max = 66,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 6, --strength
                duration = 720,
                min = 60,
                max = 66,
            },
            {
                id = 3, --shield
                duration = 720,
                min = 60,
                max = 66,
            },
            {
                id = 4, --fireShield
                duration = 720,
                min = 60,
                max = 66,
            },
            {
                id = 98, --resistNormalWeapons
                duration = 720,
                min = 60,
                max = 66,
            },
        },
        text = "He is the Lord, and Father of the Mountain.\nHe wakes, and the land wakes with him.\nAll the land, and all of its people, shall rise from sleep, and sweep the land clean of the n'wah.\nWhy have you denied him?\nAs Lord Dagoth has said. All shall greet him as flesh, or as dust.\nIt is the Hour of Wakening. He comes forth in his glory, and his people shall rejoice, and his enemies shall scatter like dust."
    },
}

this.miscRituals = {
    {
        name = "Caius's 'Ritual'",
        id = "caius_skooma",
        handler = "Miscellaneous Rituals",
        skillReq = 5,
        skill = "divine_theology",
        description = "Caius taught me a 'ritual'",
        image = "Icons\\PRAY\\art\\caius_skooma.dds",
        knowledgeRequirement = function()
            return tes3.getJournalIndex{ id = "A1_1_FindSpymaster" } >= 11
        end,
        soundPath = "Fx\\envrn\\undrwatr.wav",
        skillProgress = 0,
        materials = {
            { material = "skooma_pipe", count = 1},
            { material = "pray_moon_sugar", count = 1},
        },
        spellEffects = {
            {
                id = 79, --fortifyAttribute
                attribute = 0, --strength
                duration = 720,
                min = 20,
                max = 30,
            },
            {
                id = 79, --fortifyAttribute
                attribute = 4, --speed
                duration = 720,
                min = 20,
                max = 30,
            },
            {
                id = 17, --drainAttribute
                attribute = 1, --intelligence
                duration = 720,
                min = 20,
                max = 30,
            },
            {
                id = 17, --drainAttribute
                attribute = 3, --agility
                duration = 720,
                min = 20,
                max = 30,
            },
            {
               id = 43, --nightEye
               duration = 720,
               min = 0,
               max = 50,
            },
            {
               id = 47, --blind
               duration = 720,
               min = 0,
               max = 50,
            },
        },
        text = "'I'm just an old man with a skooma problem.' ~ Caius Cosades",
    }
}

return this
