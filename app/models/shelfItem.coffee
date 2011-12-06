Spine = require('spine')

# Contains the items for a type 
class ShelfItem extends Spine.Model
  @configure 'ShelfItem', 'name', 'type', 'costMatrix', 'details', 'items'


  # Create a new instance of the shelfItem type and return it
  createInstance: ->
    #create new instance with details
    item = eval 'new ' + @type + " (#{JSON.stringify(@details)}, #{@type})"  #include the details in the object
    @items = [] if !@items? # If @items is not defined, make it an array
    @items.push item
    item

  # Return an instance
  findInstance: (value, name = "id") ->
    @items

  allInstances: ->
    @items

  @endpoint: location.protocol + '//' + location.host + ':' + location.port

  @fetch: ->
    $.getJSON(@endpoint, (res) => @refresh(res, clear: true))
  
module.exports = ShelfItem