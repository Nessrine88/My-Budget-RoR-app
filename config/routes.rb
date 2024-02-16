Rails.application.routes.draw do
  resources :groups do 
    resources :entities
  end
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  root "groups#index"
end