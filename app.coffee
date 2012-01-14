nats = require('nats').connect() #uri: process.env.NATS or 'nats://127.0.0.1:4242'

express = require 'express'
nowjs = require 'now'

server = express.createServer()
server.use express.static "public"
server.listen process.env.VCAP_APP_PORT or 8000

everyone = nowjs.initialize(server)

nats.subscribe 'messages', (msg) =>
  console.log msg
  # validate msg
  # parse msg
  #{ user, body } = JSON.parse(msg)
  everyone.now.receiveMessage "tom", msg

everyone.now.distributeMessage = (user, body) ->
  nats.publish 'messages', JSON.stringify({user, body})