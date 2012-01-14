Ext.define "CatChat2.view.Messages.New",
  extend: "Ext.form.Panel"
  xtype: 'newmsgform'
  id: 'newmsgform'
  config:
    fullscreen: true
    autoRender: true
    modal: true
    hideOnMaskTap: false
    height: 305
    width: 480
    centered: true

    items: [
      xtype: 'toolbar'
      title: 'New Message'
    ,
      xtype: 'textareafield'
      name: 'body'
      label: 'Message'
    ,
      xtype: 'panel'
      layout: 'hbox'
      items: [
        text: 'Send'
        xtype: 'button'
        id: 'sendmsg'
        ui: 'action'
        flex: 1
      ,
        xtype: 'spacer'
        flex: 1
      ,
        text: 'Cancel'
        xtype: 'button'
        ui: 'decline'
        id: 'cancelmsg'
        flex: 1
      ]
    ]