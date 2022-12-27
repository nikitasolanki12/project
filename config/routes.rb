Rails.application.routes.draw do
  # get 'user/index'
  # get 'home/index'
  devise_for :users, controllers: {
           :sessions => "users/sessions",
           :registrations => "users/registrations"}

            resources :users 
             root to: "home#index"
            resources :posts do 
              get :top5commentedpost, on: :collection
              get :commentedpost, on: :collection
              resources :comments
            end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   # root "home#index"
   #"/products/display" => "products#index"
end
