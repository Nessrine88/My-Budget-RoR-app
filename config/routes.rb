Rails.application.routes.draw do
  get 'splash_screen/index'
  resources :groups do 
    resources :entities
  end
  get "up" => "rails/health#show", as: :rails_health_check
  authenticated :user do
    root "groups#index", as: :authenticated_root
  end

  unauthenticated do
    root "splash_screen#index" , as: :unauthenticated_root
  end
  devise_for :users

end