Tweeporter::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
 # resources :users
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  get "events/index"

  get "home/index"

  get "events/add"
  
  get "confirmation/index"

	default_url_options :host => "localhost:3000"
  resources :events 
 
  root to: "home#index"

  resources :events do
    member do 
        post 'create'
    end
end
end
