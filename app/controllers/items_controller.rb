class ItemsController < ApplicationController

  def index
    @header_categories = Category.where(ancestry: nil)
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def confirm
    #購入確認画面表示のためのアクション
  end

private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id)
  end

end
