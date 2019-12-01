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
  root 'homes#top'
# Admin
  get 'admins/users/:id/favorites', to: 'admins/users#favorites', as: 'admins_users_favorites'
  delete 'admins/users/:id' => 'admins/users#destroy', as: 'admins_delete_user'
  get 'admin/users/:user_id/sales_histories' => 'admin/sales_histories#index', as: 'admin_user_sales_histories'
  namespace :admins do
    resources :albums do
      resources :reviews, only:[:edit, :create, :update, :destroy]
    end
    resources :artists
    resources :genres
    resources :labels
    resources :sales_histories, only: [:index, :update]
    resources :users, only: [:index, :show, :create, :edit, :update, :destroy]
  end
  resources :admins

# User
  get 'users/:id/carts' => 'users#carts', as: 'user_carts'
  get 'users/:id/favorites', to: 'users#favorites', as: 'users_favorites'
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe_user'
  delete 'users/:id' => 'users#destroy', as: 'delete_user'
  patch 'users/:user_id/sales_histories/:id' => 'sales_histories#hidden', as: 'user_hidden_history'
  get 'thanks' => 'homes#thanks', as: 'thanks'
  get 'albums/search' => 'albums#search', as: 'search'
  get 'artists/:id/albums' => 'artists#albums', as: 'artist_albums'
  get 'genres/:id/albums' => 'genres#albums', as: 'genre_albums'
  get 'labels/:id/albums' => 'labels#albums', as: 'label_albums'
  resources :albums, only:[:index, :show] do
    resources :reviews, only:[:edit, :create, :update, :destroy]
    resource :favorites, only:[:create, :destroy]
    resources :orders, only:[:create, :update, :destroy]
  end
  resources :users, only:[:show, :edit, :update] do
    resources :shipping_addresses
    resources :sales_histories, only:[:new, :index, :create]
  end
  resources :artists, only:[:index]
  resources :labels, only:[:index]
  resources :genres, only:[:index]
  resources :orders, only:[:create, :update, :destroy]
  # sales_histories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
