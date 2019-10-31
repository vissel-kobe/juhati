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
  get 'users/:id/carts' => 'users#carts', as: 'users_carts'
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe_user'
  delete 'users/:id' => 'users#destroy', as: 'delete_user'
  root 'homes#top'
  get 'albums/search' => 'albums#search', as: 'search'
  resources :admins
  get 'admin/users/:id/favorites', to: 'admins#favorites', as: 'admin_users_favorites'
  resources :users, only:[:index, :show, :edit, :update]
  get 'users/:id/favorites', to: 'users#favorites', as: 'users_favorites'
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
  resources :sale_histories, only:[:index, :create]
  post 'sale_histories/:id' => 'sale_histories#change_status', as: 'change_status_history'
  post '/users/:user_id/histories/:id' => 'sale_histories#hidden', as: 'hidden_history'
  get '/users/:id/histories' => 'sale_histories#index', as: 'user_history'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
