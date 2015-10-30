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


target = "Eliot Williams"
targetID = 1

module.exports = (robot) ->

  robot.hear /[+-]{21}$/, (msg) ->
    if (msg.message.user.name == target)
        targetID = msg.message.user.id
        msg.send "DAMMIT, #{target}, you've been cited for karma bombing!!!!!!"
        msg.reply "--"

        # console.log msg.message.user

    else if (msg.message.user.id == targetID)
        target = msg.message.user.name
        msg.reply "++. You can change your name to #{target}, but you are still on the karma bomber watch list."

    else
        target = msg.message.user.name
        targetID = msg.message.user.id
        msg.send "#{target}, userID: #{targetID}, this is the karma police. You've been warned for karma bombing"

