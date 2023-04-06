Rails.application.routes.draw do
  resources :registration_forms
  devise_for :users
  root 'forms#index'
end
