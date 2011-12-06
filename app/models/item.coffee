Spine = require('spine')

class Item extends Spine.Model
  @configure 'Item', 'name', 'type', 'images', 'description', 'quantity', 'cost'
  
  calculateCost: ->
    parentObj = ShelfItem.findByAttribute('type', @constructor.className)
    @cost = parentObj.costMatrix[@quantity]

module.exports = Item