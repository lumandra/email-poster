Rails.application.routes.draw do
  devise_for :user

  root to: 'application#index'

  resources :incoming_mails, only: [:create]
end
