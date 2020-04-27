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
  resources :products, only: [:new, :create, :destroy] do
    # 商品出品ページでのカテゴリー選択アクション
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  # 商品出品ページでvalidationにかかった時用のカテゴリー選択アクション
  resources :get_category_children, only: [:index]
  resources :get_category_grandchildren, only: [:index]

  resources :signup, only: [:index]
  resources :credit_card, only: [:new] do
    collection do
      post 'registration'
      post 'buy'
      post 'delete'
    end
  end

  resources :complete, only: [:index]
  resources :credit_card, only: [:index] do

  end
  resources :address, only: [:index, :create, :edit, :update] do
  end
end
