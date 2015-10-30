# Description:
#   Karma Police
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   attempt to prevent Raj from karma bombing
#
# Author:
#   eliot


target = "bluejays"
targetID = 99999

module.exports = (robot) ->

  robot.hear /[+-]{5}$/, (msg) ->
    if (msg.message.user.name == target)
        targetID = msg.message.user.id
        console.log targetID
        console.log msg.message.user
        msg.send "DAMMIT, @#{target}!!!!!!"
        msg.send "@#{target}------"

        # console.log msg.message.user

    else if (msg.message.user.id == targetID)
        target = msg.message.user.name
        console.log target
        console.log msg.message.user
        msg.send "DAMMIT, @#{target}!!!!!!"
        msg.send "@#{target}------"

    else
        msg.send "Wait, is that @#{target}?"
        msg.send "@#{target}++++++"

        console.log msg.message.user
