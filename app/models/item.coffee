Spine = require('spine')

class Item extends Spine.Model
  @configure 'Item', 'name', 'type', 'images', 'description', 'quantity', 'cost'
  
  calculateCost: ->
    @quantity = 0 if !@quantity?
    @cost = 0
    parentObj = ShelfItem.findByAttribute('type', @constructor.className)
    @cost = parentObj.costMatrix[@quantity] if parentObj.costMatrix[@quantity]
    @cost

  save: ->
    super
    @calculateCost
    @

module.exports = Item