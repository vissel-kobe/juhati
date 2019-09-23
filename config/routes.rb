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
  post 'users/:id' => 'users#delete', as: 'delete_user'
  root 'homes#top'
  resources:admins
  resources:users, only:[:index, :show, :edit, :update]
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
