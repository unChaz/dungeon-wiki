Rails.application.routes.draw do

  namespace :api do
    resources :spells
    resources :locations
    resources :players
    resources :monsters
    resources :monster_pools
    resources :campaigns
    resources :encounters
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  get '*path' => 'home#index'
  root to: 'home#index'
end
