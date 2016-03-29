module.exports = (robot) ->
  # helper method to get sender of the message
  get_username = (response) ->
    "@#{response.message.user.name}"

  # helper method to get channel of originating message
  get_channel = (response) ->
    if response.message.room == response.message.user.name
      "@#{response.message.room}"
    else
      "##{response.message.room}"

  robot.respond /where is (.*)/i, (msg) ->
    nameCheck = msg.match[1]
    nameStatus = robot.brain.get(nameCheck)

    if nameStatus != null
      msg.send "#{nameCheck} is #{nameStatus}"
    else
      msg.send "#{nameCheck} not found!"

  # robot.respond /set (.*) busy/i, (msg) ->
  #   name = msg.match[1]
  #   robot.brain.set(name, 'busy')
  #   msg.send "#{name} is busy!"
  #
  # robot.respond /set (.*) free/i, (msg) ->
  #   name = msg.match[1]
  #   robot.brain.set(name, 'free')
  #   msg.send "#{name} is free!"

  robot.router.post '/hubot/notify/:room', (req, res) ->
    room = req.params.room
    data = if req.body.payload? then JSON.parse req.body.payload else req.body
    # data = JSON.parse(req.body)
    user = data.user
    status = data.status

    robot.brain.set(user, status)
    res.send "#{JSON.stringify(data)}"
    res.end()
