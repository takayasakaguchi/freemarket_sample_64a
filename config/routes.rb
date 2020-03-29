Rails.application.routes.draw do
  root to: 'posts#toppage'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 

  resources :purchases, only: [:index]
  resources :products, only: [:new]
  # 動作確認用URL（サーバーサイド情報がまだないため仮ルート設定）
  get "/pruducts/1", to: 'products#show'
  resources :signup, only: [:index]
  resources :credit_card, only: [:new] do
    collection do
      post 'registration'
    end
  end
  resources :address, only: [:index, :edit] do
  end

end
