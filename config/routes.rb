Rails.application.routes.draw do
  root "purchases#index"
  resources :credit_card, only: [:index] do
  end
end
