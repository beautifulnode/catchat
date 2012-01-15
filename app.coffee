nats = require('nats').connect()
#{ uri: process.env.NATS or 'nats://127.0.0.1:4242' }

express = require 'express'
nowjs = require 'now'

server = express.createServer()
server.use express.static "public"
server.listen process.env.VCAP_APP_PORT or 8000

everyone = nowjs.initialize(server, {socketio: {transports: ['xhr-polling', 'jsonp-polling']}})

nats.subscribe 'messages', (msg) =>
  # validate msg
  # parse msg
  { user, body } = JSON.parse(msg)
  everyone.now.receiveMessage user, body

everyone.now.distributeMessage = (user, body) ->
  #console.log body
  nats.publish 'messages', JSON.stringify({user, body})