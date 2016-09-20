Rails.application.routes.draw do

  devise_for :user

  root to: 'application#index'
  resources :reports
  resources :user_reports, only: [:index] do
    post :subscribe
  end
  resources :incoming_mails, only: [:create]
end
