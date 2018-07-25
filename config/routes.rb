Rails.application.routes.draw do
  get '/rails/info/properties' => "rails/info#properties"
  get '/rails/info/routes'     => "rails/info#routes"
  get '/rails/info'            => "rails/info#index"
  root to: "rails/welcome#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :ideas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy'#, :as => :destroy_user_session
  end
end
