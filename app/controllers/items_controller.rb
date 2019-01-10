class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :confirm, :edit]
  before_action :set_item_category, only: [:show, :user_buy_screen, :pay_jp]

  def index

    @categories = Category.where(ancestry: nil)
    @items = Item.order("created_at DESC").page(params[:page]).per(12)

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

  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.user_id == current_user.id
    redirect_to "/users/items_show"
  end

  def update
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.update(item_params)
      redirect_to item_path
    end
  end

  def confirm
    #購入確認画面表示のためのアクション
  end

  def search
    @items = Item.where('name LIKE?', "%#{params[:search]}%")
  end

  def user_buy_screen

  end

  def pay_jp
    Payjp.api_key = 'sk_test_67bf7b9b9f7b559259f8e304'
    charge = Payjp::Charge.create(
    amount: @item.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    @item.buyer_id = current_user.id
    @item.save
    redirect_to root_path
  end

private

  def set_item_category
    @item = Item.find(params[:id])
    @item_category = ItemCategory.select('category_id').find_by(item_id: params[:id])
    @category = Category.find_by(id: @item_category.category_id)
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :item_categories_attributes => [:id, :category_id]).merge(user_id: current_user.id)
  end

end
