Rails.application.routes.draw do
  resources :mypage, only: [:index]
end
