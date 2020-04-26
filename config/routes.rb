Rails.application.routes.draw do

  root to: 'posts#toppage'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } 

  devise_scope :user do
    
  end

  resources :mypage, only: [:index]
  resources :logout, only: [:index]
  resources :purchases, only: [:index]
  resources :products, only: [:new, :create] do
    # 商品出品ページでのカテゴリー選択アクション
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
  end

  # 商品出品ページでvalidationにかかった時用のカテゴリー選択アクション
  resources :get_category_children, only: [:index]
  resources :get_category_grandchildren, only: [:index]

  # 動作確認用URL（サーバーサイド情報がまだないため仮ルート設定）
  get "/pruducts/1", to: 'products#show'
  resources :signup, only: [:index]
  resources :complete, only: [:index]
  resources :credit_card, only: [:index] do
  end
  resources :address, only: [:index, :edit] do
  end
end
