# Description:
#   Checks if a url is down
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot is down <url> - Is a page down

module.exports = (robot) ->
    
  robot.respond /is down (.*)/i, (msg) ->
    msg.send "Checking on #{ msg.match[1] } for you now..."
    
    up = "It's just you, #{ msg.match[1] } looks up from here!"
    down = "It's not just you #{ msg.match[1] } looks down from here too!"
    
    msg.http("http://www.isup.me/#{ msg.match[1] }").get() (err, res, body) ->
      answer = if (body.indexOf('It\'s just you.') > 0) then up else down
      msg.send answer

