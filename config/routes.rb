Rails.application.routes.draw do
  get 'signup/signup'
  root 'purchases#index'
  resources :credit_card, only: [:index] do
  end
  resources :address, only: [:index, :edit] do
  end
end
