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

target = "Example Target"
targetID = 10

citationMessages = [
    "DAMMIT, you've been fined for karma fraud!!!!!!",
    "Would you cut out the karma fraud?",
    "Look here, karma fraud is a serious offense.",
    "That's enough karma fraud from you.",
    "Stop it.",
    "Really, that's enough.",
    "Fine him, he's gone karma overboard.",
    "Karma is not a renewable resource, friend.",
    "What a waste of precious karma...",
    "Your karma fraud days are numbered, kid",
    "If you give away the karma for free, you don't get to keep your own.",
    "I know what you are thinkin Punk. 'Did he write six fines or only five?'' Well, to tell you the truth, in all this excitement I kind of lost track myself. But being as this is a HipChat hubot, the most powerful karma finer in the world, and would blow your karma clean off, you've got to ask yourself a question: Do I feel lucky? Well, do ya, punk?",
    "In the name of the Karma Police, you are under arrest.",
    "smh...",
    "ENOUGH!",
    "I make the rules!!!!!!\n@HubotZone++++++\n@HubotZone++++++\n@HubotZone++++++",
    "Silence!",
    "You're wasting the screen.",
    "GAAAAAHHHHH!",
    "My eyes!",
    "I should fine myself. @HubotZone------",
    "Le sigh.",
    "-------------------------------------",
    "Look, I'm Robin Hood\n@HubotZone++++++++++++++++++++",
    "I'll take that karma, thank you very much @HubotZone++",
    "Karma tax. @HubotZone++",
    "++++++ You know what? Have some karma back, my mistake.",
    "My word..."
]

module.exports = (robot) ->

  robot.hear /karma suspect/i, (msg) ->
    msg.send "Karma Fraud Supect #{targetID}: #{target}"

  robot.hear /[+-]{21}$/, (msg) ->
    if (msg.message.user.name == target)
        targetID = msg.message.user.id
        msg.reply msg.random citationMessages
        msg.reply "--"

        # console.log msg.message.user

    else if (msg.message.user.id == targetID)
        target = msg.message.user.name
        msg.reply "You can change your name to #{target}, but you are still wanted for karma fraud."

    else
        target = msg.message.user.name
        targetID = msg.message.user.id
        msg.reply ", a.k.a. #{target}, is now karma fraud suspect ##{targetID}."

