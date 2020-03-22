Rails.application.routes.draw do
  root to: 'posts#toppage'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 

  root "purchases#index"
  resources :products, only:[ :new ]
  resources :signup, only: [:index]
  resources :credit_card, only: [:index] do
  end
  resources :address, only: [:index, :edit] do
  end

end
