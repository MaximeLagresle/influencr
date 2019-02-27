Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :users
  root to: 'media#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :media, only: [:index, :show]
  resources :influencers, only: [:show]
  resources :states, only: [:create]
end
