Rails.application.routes.draw do
  resources :mypage, only: [:index]
  resources :logout, only: [:index]
end
