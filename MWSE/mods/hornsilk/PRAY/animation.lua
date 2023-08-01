local this = {}

-- https://mwse.github.io/MWSE/references/animation-groups/
-- try `the sitting mod` for some better animations
-- Use tes3.loadAnimation to play custom animations

this.defaultAnimationBegin = function()
    tes3.setVanityMode{enabled = true, checkVanityDisabled = false}
	tes3.playAnimation({ reference = tes3.player, group = tes3.animationGroup.idle8})
end

this.defaultAnimationEnd = function()
    tes3.setVanityMode{enabled = false, checkVanityDisabled = false}
    tes3.loadAnimation{reference = tes3.player}
end

return this