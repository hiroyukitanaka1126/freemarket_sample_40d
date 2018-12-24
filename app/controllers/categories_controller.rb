class CategoriesController < ApplicationController
  def index
    @categories = Category.select("name").where(ancestry: nil)
  end
end
