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
  resources:admins
  get 'admin/users/:id/favorites', to: 'admins#favorites', as: 'admin_users_favorites'
  resources:users, only:[:index, :show, :edit, :update]
  get 'users/:id/favorites', to: 'users#favorites', as: 'users_favorites'
  resources:artists, only:[:index, :edit, :create, :update, :destroy]
  resources:albums do
    resources:reviews, only:[:edit, :create, :update, :destroy]
    resource:favorites, only:[:create, :destroy]
    resource:orders, only:[:create, :update, :destroy]
  end
  resources:users do
    resources:shipping_addresses
  end
  resources:labels
  resources:genres
  resources:orders, only:[:create, :update, :destroy]
  resources:sale_histories, only:[:index, :show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
