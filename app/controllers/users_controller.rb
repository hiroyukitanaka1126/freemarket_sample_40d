class UsersController < ApplicationController
  before_action :authenticate_user!, except: :signup

  def index
  end

  def signup
  end

  def items_show
  end

  def update
    user = User.find(params[:id])
    if user.id == current_user.id
      user.update(user_params)
    end
    redirect_to "/users"
  end

  def profile
  end

  def card
  end

  def identification
    @user = current_user
  end

  def logout_confirmation
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :postal_code, :prefecture, :municipality, :address)
  end

end
