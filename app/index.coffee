require('lib/setup')

Spine = require('spine')
Shop = require('controllers/shop')

class App extends Spine.Controller
  events:
    'click .help': 'helpDialog'  
    
  constructor: ->
    super
    @html require('views/layout')
    myLayout = $('body').layout({
      north__size:    75,
      west__size:     300,
      west__onresize:   $.layout.callbacks.resizePaneAccordions
    })
        
    @shop = new Shop

  helpDialog: ->
    #alert 'You need help?'
    
    $("#dialog").dialog({ autoOpen: true, title: 'Cart Help' });
    #$( "#dialog" ).dialog();

module.exports = App
    