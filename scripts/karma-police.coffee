# Description:
#   Karma Police
#   An attempt to "police" karma bombing
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   
#
# Author:
#   eliot


target = "eliot"
targetID = 1

module.exports = (robot) ->

  robot.hear /[+-]{11}$/, (msg) ->
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
        msg.send "Clever, @#{target}. You changed your name!"
        msg.send "@#{target}++"

    else
        msg.send "Wait, is that Raj?"
        msg.send "@#{target}++++++"

        console.log msg.message.user
