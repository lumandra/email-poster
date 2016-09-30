Rails.application.routes.draw do

  devise_for :user

  root to: 'application#index'
  resources :reports do
    resources :slack_channels
  end

  resources :incoming_mails, only: [:create]
end
