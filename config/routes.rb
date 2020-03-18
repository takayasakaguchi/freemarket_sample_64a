Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_up", to: "users/registrations#new"
    # get "sign_out", :to => "users/sessions#destroy" 
  end
end

# devise_for :users, :controllers => {
#   :registrations => 'users/registrations'
#  }
 
#  devise_scope :user do 
#   post 'users/sign_up/confirm' => 'users/registrations#confirm'
#   post 'users/sign_up/complete' => 'users/registrations#complete' 
#  end