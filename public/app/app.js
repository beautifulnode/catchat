(function() {

  Ext.Loader.setConfig({
    enabled: true
  });

  Ext.application({
    name: 'CatChat2',
    controllers: ['Main'],
    models: ['Message'],
    launch: function() {
      return console.log("Launch Called");
    }
  });

}).call(this);
