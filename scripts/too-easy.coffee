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
   robot.hear /(ship it|validation|done|Mike|Miguel)/i, (msg) ->
     msg.send "Tooooo Easy!!!!"
   robot.hear /(Frank)/i, (msg) ->
     msg.send "Franky is Cranky!"
