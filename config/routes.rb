Rails.application.routes.draw do
  root 'static_pages#home'
  get    'help'          => 'static_pages#help'
  get    'about'         => 'static_pages#about'
  get    'contact'       => 'static_pages#contact'
  get    'signup'        => 'users#new'
  get    'login'         => 'sessions#new'
  post   'login'         => 'sessions#create'
  delete 'logout'        => 'sessions#destroy'
  resources :users
  resources :tags
  resources :books
  resources :searches, only: [:new, :index]
  resources :tag_search, only: [:new, :index]
end
