Rails.application.routes.draw do
  root 'forms#index'
  devise_for :users
  resources :registration_forms do
    collection { get 'submitted' }
		collection { get 'not_found' }
  end
end
