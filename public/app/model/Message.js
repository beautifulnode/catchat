(function() {

  Ext.define('CatChat2.model.Message', {
    extend: 'Ext.data.Model',
    fields: ['user', 'body', 'createdAt']
  });

}).call(this);
