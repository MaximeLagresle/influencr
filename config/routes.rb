Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'

  devise_for :users

  root to: 'pages#home'

  get "/onboarding", to: "pages#home", as: "onboarding"

  get "/tutorial", to: "pages#tutorial", as: "tutorial"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :media, only: [:index, :show]
  delete "/influencers/:id", to: "influencers#show"
  resources :influencers, only: [:show] do
    get "/media_type/:formata", to: "influencers#collect_media", as: "type"
    resources :preferences, only: [:create, :destroy]
  end

  resources :states, only: [:create, :update]
  resources :preferences, only: [:index, :create]

end
