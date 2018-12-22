Rails.application.routes.draw do

  devise_for :users,
  path: '',
  path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
  controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  root 'items#index'

  resources :items do
    member do
      get :confirm
    end
  end

  resources :users do
    collection do
      get :signup
      get :logout_confirmation
    end
  end
end

#購入確認画面の表示のためconfirmを追加。itemのid拾うと思われるのでmemberで一旦書いてみる
