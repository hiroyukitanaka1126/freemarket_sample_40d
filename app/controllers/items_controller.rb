class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
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
    @item = Item.find(params[:id])
  end

  def confirm
    #購入確認画面表示のためのアクション
  end

private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image)
  end

end
