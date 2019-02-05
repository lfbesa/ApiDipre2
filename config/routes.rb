Rails.application.routes.draw do
  resources :links
  resources :articles
  devise_for :users
  resources :contacts
  resources :events
  root to: "home#index"
  get '/privacy_policy', to: 'home#privacy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :contacts
      resources :articles
      resources :events
      resources :links
    end
  end
end
