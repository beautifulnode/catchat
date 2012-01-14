Ext.define 'CatChat2.controller.Main', 
  extend: 'Ext.app.Controller'
  
  views: ['Viewport', 'Messages.New']
  models: ['Message']
  stores: ['Messages']
  
  refs: [
    ref: 'viewport'
    selector: 'viewportview'
    autoCreate: true
    xtype: 'viewportview'
  ,
    ref: 'newmsg'
    selector: 'newmsgform'
    xtype: 'newmsgform'
    autoCreate: true
    
  ]
  
  init: ->
    Message = @getMessageModel()
    messages = @getMessagesStore()
    
    console.log 'Main Controller Called'
    @control
      '#newmsgbutton':
        tap: -> @getNewmsg().show()
      '#cancelmsg':
        tap: -> 
          msgform = @getNewmsg()
          msgform.setValues body: ''
          msgform.hide()
      '#sendmsg':
        tap: ->
          msgform = @getNewmsg()
          body = msgform.getValues().body
          msgform.setValues body: ''
          msgform.hide()
          now.distributeMessage 'tom', body

    now.receiveMessage = (user, body) =>
      msg = new Message { user, body, createdAt: new Date() }
      messages.add msg
      messages.sort()
      console.log msg
    @getViewport()

