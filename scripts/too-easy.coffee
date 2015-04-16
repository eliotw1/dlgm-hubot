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

  robot.respond /radiator/i, (msg) ->
     msg.send "http://bit.ly/1zWRMLJ Too easy #{msg.message.user.name}"
