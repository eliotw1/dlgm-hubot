# Description:
#    Too easy is an internal joke on the iOS team.  This script listens for certain words and then writes a too easy message to the team
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   Jake Payton

 module.exports = (robot) ->
   robot.hear /(ship it|validation|Mike|Miguel)/i, (msg) ->
     msg.send "#{msg.message.user.name} says Tooooo Easy!!!!"
   robot.hear /(Frank)/i, (msg) ->
     msg.send "Franky is Cranky #{msg.message.user.name}!"
