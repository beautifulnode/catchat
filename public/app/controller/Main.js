(function() {

  Ext.define('CatChat2.controller.Main', {
    extend: 'Ext.app.Controller',
    views: ['Viewport', 'Messages.New'],
    models: ['Message'],
    stores: ['Messages'],
    refs: [
      {
        ref: 'viewport',
        selector: 'viewportview',
        autoCreate: true,
        xtype: 'viewportview'
      }, {
        ref: 'newmsg',
        selector: 'newmsgform',
        xtype: 'newmsgform',
        autoCreate: true
      }
    ],
    init: function() {
      var Message, messages,
        _this = this;
      Message = this.getMessageModel();
      messages = this.getMessagesStore();
      console.log('Main Controller Called');
      this.control({
        '#newmsgbutton': {
          tap: function() {
            return this.getNewmsg().show();
          }
        },
        '#cancelmsg': {
          tap: function() {
            var msgform;
            msgform = this.getNewmsg();
            msgform.setValues({
              body: ''
            });
            return msgform.hide();
          }
        },
        '#sendmsg': {
          tap: function() {
            var body, msgform;
            msgform = this.getNewmsg();
            body = msgform.getValues().body;
            msgform.setValues({
              body: ''
            });
            msgform.hide();
            return now.distributeMessage('tom', body);
          }
        }
      });
      now.receiveMessage = function(user, body) {
        var msg;
        msg = new Message({
          user: user,
          body: body,
          createdAt: new Date()
        });
        messages.add(msg);
        messages.sort();
        return console.log(msg);
      };
      return this.getViewport();
    }
  });

}).call(this);
