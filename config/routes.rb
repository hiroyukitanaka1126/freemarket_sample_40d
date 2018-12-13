Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    member do
      get :confirm
    end
  end
end

#購入確認画面の表示のためconfirmを追加。itemのid拾うと思われるのでmemberで一旦書いてみる
