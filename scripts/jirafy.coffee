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
  robot.brain.on 'loaded', (data = {}) ->
    keys = robot.brain.get(jirafy_key("keys")) || {}
    for key in Object.keys(keys)
      addListener key
  
  robot.respond /jirafy \b(\w+)\b ([^\s]+)/i, (msg) ->
    key = msg.match[1]
    oldKey = keys[key]
    addKey key, msg.match[2]
    addListener key if not oldKey
    
  addListener = (key) ->
    robot.hear new RegExp("#{key}\\-\\d+", "i"), (msg) ->
      msg.send "#{keys[key]}#{msg.match[0]}"
  
  addKey = (key, url) ->
    keys[key] = url
    robot.brain.set jirafy_key("keys"), keys