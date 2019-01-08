class CategoriesController < ApplicationController

  def index
    @categories = Category.select("name").where(ancestry: nil)
  end

  def show
    @item_categories = ItemCategory.select('item_id').where(category_id: params[:id])
    @items = Item.where(id: @item_categories)
  end

end
