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


target = "Eliot"
targetID = 1

module.exports = (robot) ->

  robot.hear /[+-]{11}$/, (msg) ->
    if (msg.message.user.name == target)
        targetID = msg.message.user.id
        msg.send "DAMMIT, @#{target}!!!!!!"
        msg.send "@#{target}--"

        # console.log msg.message.user

    else if (msg.message.user.id == targetID)
        target = msg.message.user.name
        msg.send "Clever, @#{target}. You changed your name!"
        msg.send "@#{target}++"

    else
        target = msg.message.user.name
        targetID = msg.message.user.id
        msg.send "@#{target}, userID: #{targetID}, this is the karma police. You've been warned for karma bombing"

