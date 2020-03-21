Rails.application.routes.draw do
  # devise_for :users
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

# devise_for :users, :controllers => {
#   :registrations => 'users/registrations'
#  }
 
#  devise_scope :user do 
#   post 'users/sign_up/confirm' => 'users/registrations#confirm'
#   post 'users/sign_up/complete' => 'users/registrations#complete' 
#  end