Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 

  get "signup/signup"
  root "purchases#index"
  resources :credit_card, only: [:index] do
  end
  resources :address, only: [:index, :edit] do
  end
end

