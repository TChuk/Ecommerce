Rails.application.routes.draw do

  get 'customers/show'
  get 'customers/create'
  get 'customers/update'
  get 'customers/destroy'

  resource :cart, only: [:show]
  resources :line_items, only: [:create, :update, :destroy]

  get '/', to: 'products#index', as: 'index'

  get 'products/:id' => 'products#show', as: 'product', id: /\d+/
  get 'products/sort/:id' => 'products#sort', as: 'sort', id: /\d+/
  get 'products/condition/:catid' => 'products#sort', as: 'catsort', catid: /\d+/
  post 'products/:id' => 'line_items#create'

  get 'products/search_results' => 'products#search_results'
  post 'products/search_results' => 'products#search_results', :as => 'search_results'
  post '/add_to_cart/:product_id' => 'products#add_to_cart', :as => 'add_to_cart'

  get 'users/new' => 'users#new', :as => 'new_user'
  post 'users/new' => 'users#create'
  get 'users/log_in' => 'users#log_in', :as => 'log_in'
  post 'users/log_in/' => 'users#authenticate'
  get 'users/log_out'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
