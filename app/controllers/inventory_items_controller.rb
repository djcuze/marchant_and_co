class InventoryItemsController < ApplicationController
  def new
    @inventory_item = InventoryItem.new
  end

  def create
    @inventory_item = InventoryItem.new(inventory_item_params)
  end

  private

  def inventory_item_params
    params.require(:inventory_items).permit(:description, :quantity)
  end
end