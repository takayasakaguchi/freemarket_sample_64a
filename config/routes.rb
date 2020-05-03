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
  resources :purchases, only: [:show]

  resources :products, only: [:new, :create, :show, :destroy, :edit, :update] do
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
  resources :credit_card, only: [:index, :new] do
    collection do
      post 'registration'
      post 'delete'
    end
    member do
      post 'buy'
    end
  end

  resources :complete, only: [:index]
  resources :credit_card, only: [:index] do

  end
  resources :address, only: [:index, :new, :create, :edit, :update] do
  end
end
