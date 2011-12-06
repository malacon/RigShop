Spine   = require('spine')
Manager = require('spine/lib/manager')
List    = require('lib/list')
$       = Spine.$

ShelfItem  = require('models/shelfItem')

class Shelf extends Spine.Controller
  elements:
    '.itemsList': 'items'

  constructor: ->
    super

    @html require('views/shelf')

    @list = {}

    for type in @types
      @list[type] = new List
        el: '.' + type,
        template: require('views/item'),
        selectFirst: false

      list = @list[type]
      list.bind 'change', @change

      @active (params) -> 
        #@log(params)
        list.change(ShelfItem.find(params.id))

    ShelfItem.bind('refresh change', @render)

  render: =>
    for type in @types
      list = @list[type]
      items = ShelfItem.filter(type)
      #list.removeActive()
      list.render(items)

#    # Create List .... WILL NEED to make multiple for each type
#    @list = new List
#      el: @items, 
#      template: require('views/item'), 
#      selectFirst: false
#
#    @list.bind 'change', @change
#
#    @active (params) -> 
#      @list.change(Item.find(params.id))
#    
#    Item.bind('refresh change', @render)
#
#  render: =>
#    items = Item.all()
#    @list.render(items)

  change: (item) =>      
    Spine.trigger 'item:show', item
    
module.exports = Shelf