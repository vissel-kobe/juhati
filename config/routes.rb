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
  resources:admins
  resources:users, only:[:index, :show, :edit, :update]
  resources:artists, only:[:index, :edit, :create, :update, :destroy]
  resources:albums do
    resources:reviews, only:[:edit, :create, :update, :destroy]
    resource:favorites, only:[:create, :destroy]
  end
  resources:labels, only:[:index, :edit, :create, :update, :destroy]
  resources:genres, only:[:index, :edit, :create, :update, :destroy]
  resources:orders, only:[:create, :update, :destroy]
  resources:sale_histories, only:[:index, :show, :create]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
