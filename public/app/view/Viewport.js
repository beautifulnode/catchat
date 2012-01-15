(function() {

  Ext.define("CatChat2.view.Viewport", {
    extend: "Ext.Panel",
    xtype: 'viewportview',
    config: {
      fullscreen: true,
      layout: 'card',
      defaults: {
        scrollable: true
      },
      items: [
        {
          xtype: "list",
          store: "Messages",
          itemTpl: "<h1>{user}</h1><br />{body}",
          items: [
            {
              title: "Messages",
              xtype: "toolbar",
              items: [
                {
                  docked: 'right',
                  ui: 'action',
                  xtype: 'button',
                  text: "New",
                  id: "newmsgbutton"
                }
              ]
            }
          ]
        }
      ]
    }
  });

}).call(this);
