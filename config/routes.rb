Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  wiki_root '/wiki'
  devise_for :users
  root to: 'home#index'
end
