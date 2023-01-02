
Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  # get 'user/index'
  # get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users
  root to: 'home#index'
  resources :posts do
    get :top5commentedpost, on: :collection
    get :commentedpost, on: :collection
    resources :comments
    resources :likes, only: %i[create destroy]
  end
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
  # "/products/display" => "products#index"
end
