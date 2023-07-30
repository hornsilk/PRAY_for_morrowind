local this = {}

this.divineAnimationBegin = function()
    tes3.setVanityMode{enabled = true, checkVanityDisabled = false}
	tes3.playAnimation({ reference = tes3.player, group = tes3.animationGroup.idle2})
end

this.divineAnimationEnd = function()
    tes3.setVanityMode{enabled = false, checkVanityDisabled = false}
    tes3.loadAnimation{reference = tes3.player}
end



return this