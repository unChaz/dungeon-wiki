Rails.application.routes.draw do

  # Map
  get 'map' => 'map#index'

  # Wiki
  mount Ckeditor::Engine => '/ckeditor'
  wiki_root '/wiki'

  # Users
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'home#index'
end
