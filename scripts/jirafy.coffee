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
  loaded = false
  
  robot.brain.on 'loaded', (data = {}) ->
    if not loaded
      loaded = true
      keys = robot.brain.get(jirafy_key("keys")) || {}
      for key in Object.keys(keys)
        addListener key
  
  robot.respond /jirafy \b(\w+)\b ([^\s]+)/i, (msg) ->
    loaded = true
    key = msg.match[1]
    addKey key, msg.match[2]
  
  addListener = (key) ->
    robot.hear new RegExp("#{key}\\-\\d+", "i"), (msg) ->
      keys = robot.brain.get(jirafy_key("keys")) || {}
      msg.send "#{keys[key]}#{msg.match[0]}"
  
  addKey = (key, url) ->
    keys = robot.brain.get(jirafy_key("keys")) || {}
    oldKey = keys[key]
    keys[key] = url
    robot.brain.set jirafy_key("keys"), keys
    addListener key if not oldKey