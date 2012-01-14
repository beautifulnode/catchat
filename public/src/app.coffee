Ext.Loader.setConfig enabled: true

Ext.application
  name: 'CatChat2'
  # Main Controller should always be last
  controllers: ['Main']
  models: ['Message']
  launch: ->
    console.log "Launch Called"
