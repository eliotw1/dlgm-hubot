# Description:
#   Listens for the JIRA ticket ID and returns the URL
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot jirafy <TLA> <expand-url>
#
# Author:
#   Mark Schall

jirafy_key = (key) ->
  "jirafy-#{key}"

module.exports = (robot) ->
  keys = robot.brain.get(jirafy_key("keys")) || {}
  if keys
    for key in Object.keys(keys)
      addListener key
  
  robot.respond /jirafy \b(\w+)\b \b(.+)\b/i, (msg) ->
    key = msg.match[1]
    addKey key, msg.match[2]
    addListener key
    
  addListener = (key) ->
    robot.hear new RegExp("#{key}\\-\\d+", "i"), (msg) ->
      msg.send "#{keys[key]}#{msg.match[0]}"
  
  addKey = (key, url) ->
    keys[key] = url
    robot.brain.set jirafy_key("keys"), keys