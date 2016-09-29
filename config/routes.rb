Rails.application.routes.draw do

  devise_for :user

  root to: 'application#index'
  resources :reports do
    resources :slack_channels, only: [:new]
  end

  resources :slack_channels, only: [:show, :edit, :update, :destroy, :index, :create]

  resources :incoming_mails, only: [:create]
end
