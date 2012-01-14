Ext.define 'CatChat2.store.Messages', 
  extend: 'Ext.data.Store'
  model: 'CatChat2.model.Message'
  sorters: [
    property: "createdAt", direction: 'DESC'
  ]
