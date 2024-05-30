local this = {}

this.data = {
	["tribunal_theology"] = {
		knowledgeRequirement = function()
			return tes3.getFaction("Temple").playerJoined
		end,
		sound = "PRAY\\tri_pray.wav"
	},
	["sixth_house_theology"] = {
		knowledgeRequirement = function()
			return tes3.getJournalIndex{ id = "A2_2_6thHouse" } > 41
		end,
		sound = "PRAY\\six_pray.wav"
	},
}

return this