Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'

  devise_for :users

  root to: 'media#index'

  get "/onboarding", to: "pages#home", as: "onboarding"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :media, only: [:index, :show]

  resources :influencers, only: [:show] do
    get "/media_type/:formata", to: "influencers#collect_media", as: "type"
  end

  resources :states, only: [:create, :update]
  resources :preferences, only: [:index, :create]
end
