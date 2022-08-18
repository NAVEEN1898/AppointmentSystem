Rails.application.routes.draw do
  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"


  namespace :api do
    namespace :v1 do
      resources :counsellors, only: [:create, :update] 
      resources :customers, only: [:create, :index] do
       get "/search", to:"customers#search"
       post "/create_feedback", to:"customers#create_feedback"
       get "/check_availability", to:"customers#check_availability"
      end
    end
  end  
end
