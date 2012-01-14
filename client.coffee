faye = require 'faye'

client = new faye.Client 'http://faye-svr.twilson63.c9.io/faye'

client.subscribe '/messages', (msg) -> console.log msg

client.publish '/message', text: 'no soup for you'
