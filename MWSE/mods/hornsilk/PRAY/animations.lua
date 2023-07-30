local this = {}

this.prayerAnimationBegin = function()
    --reference:disable()
    tes3.setVanityMode{enabled = true, checkVanityDisabled = false}
    --tes3.setPlayerControlState()
	tes3.playAnimation({ reference = tes3.player, group = tes3.animationGroup.idle2})

    timer.start{
        duration = 5/60, --duration in hours for game timers
        type = timer.game,
        callback = function ()
            tes3.setVanityMode{enabled = false, checkVanityDisabled = false}
            tes3.messageBox("prayer is over")
            tes3.loadAnimation{reference = tes3.player}
        end
    }

end

return this