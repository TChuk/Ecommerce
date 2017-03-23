Rails.application.routes.draw do
  get '/', to: 'products#index', as: 'index'

  get 'products/:id' => 'products#show', as: 'product', id: /\d+/
  get 'products/sort/:id' => 'products#sort', as: 'sort', id: /\d+/
  get 'products/condition/:catid' => 'products#sort', as: 'catsort', catid: /\d+/
  get 'products/search_results' => 'products#/search_results'
  get 'search' => 'products#search', :as => 'search'
  post 'products/search_results' => 'products#search_results',
:as => 'search_results'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
