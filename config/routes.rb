Rails.application.routes.draw do
  resources :articles
  devise_for :users
  resources :contacts
  resources :events
  root to: "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :contacts
      resources :news
      resources :events
    end
  end
end
