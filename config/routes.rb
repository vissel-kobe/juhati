Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get 'users/:id/carts' => 'users#carts', as: 'user_carts'
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe_user'
  delete 'users/:id' => 'users#destroy', as: 'delete_user'
  root 'homes#top'
  get 'thanks' => 'homes#thanks', as: 'thanks'
  get 'albums/search' => 'albums#search', as: 'search'
  resources :admins
  get 'admin/users/:id/favorites', to: 'admins#favorites', as: 'admin_user_favorites'
  resources :users, only:[:index, :show, :edit, :update]
  get 'users/:id/favorites', to: 'users#favorites', as: 'user_favorites'
  resources :albums do
    resources :reviews, only:[:edit, :create, :update, :destroy]
    resource :favorites, only:[:create, :destroy]
    resource :orders, only:[:create, :update, :destroy]
  end
  resources :users do
    resources :shipping_addresses
  end
  resources :artists, only:[:new, :index, :edit, :create, :update]
  resources :labels, only:[:new, :index, :edit, :create, :update]
  resources :genres, only:[:new, :index, :edit, :create, :update]
  resources :orders, only:[:create, :update, :destroy]
  # sales_histories
  get 'sales_histories' => 'sales_histories#index', as: 'sales_histories'
  patch 'sales_histories/:id' => 'sales_histories#update', as: 'sales_history'
  put 'sales_histories/:id' => 'sales_histories#update'
  get 'users/:user_id/histories' => 'sales_histories#index', as: 'user_histories'
  get 'users/:user_id/histories/new' => 'sales_histories#new', as: 'user_confirm_purchase'
  post 'users/:user_id/histories' => 'sales_histories#create', as: 'user_create_history'
  patch 'users/:user_id/histories/:id' => 'sales_histories#hidden', as: 'user_hidden_history'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
