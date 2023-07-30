local this = {}

-- https://mwse.github.io/MWSE/references/animation-groups/

this.divineAnimationBegin = function()
    tes3.setVanityMode{enabled = true, checkVanityDisabled = false}
	tes3.playAnimation({ reference = tes3.player, group = tes3.animationGroup.idle8})--, lower = tes3.animationGroup.death1})
end

this.divineAnimationEnd = function()
    tes3.setVanityMode{enabled = false, checkVanityDisabled = false}
    tes3.loadAnimation{reference = tes3.player}
end

return this