class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :confirm]

  def index

    @categories = Category.where(ancestry: nil)
    @items = Item.order("created_at DESC").limit(4)

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

  def search
    @items = Item.where('name LIKE?', "%#{params[:search]}%")
  end

  def user_buy_screen
    @item = Item.find(params[:id])
  end

  def pay_jp
    amount = Item.find(params[:id]).price
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(currency: "jpy", amount: amount, card: params["payjp-token"])
    redirect_to root_path, notice: "支払いが完了しました"
  end


private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image).merge(user_id: current_user.id)
  end

end
