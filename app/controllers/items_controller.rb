class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :confirm]

  def index

    @categories = Category.where(ancestry: nil)
    @items = Item.order("created_at DESC").limit(4)

  end

  def new
    @item = Item.new
    @item.item_categories.build
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

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.user_id == current_user.id
    redirect_to "/users/items_show"
  end

  def confirm
    #購入確認画面表示のためのアクション
  end

  def search
    @items = Item.where('name LIKE?', "%#{params[:search]}%")
  end

  def user_buy_screen
    @item = Item.find(params[:id])
  end

  def pay_jp
    item = Item.find(params[:id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(currency: "jpy", amount: item[:price], card: params["payjp-token"])
    pay_jp_item_buyer_id_update(item)
    redirect_to root_path, notice: "支払いが完了しました"
  end

  def pay_jp_item_buyer_id_update(item)
    item.update( buyer_id: current_user.id)
  end


private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :item_categories_attributes => [:id, :category_id]).merge(user_id: current_user.id)
  end

end
