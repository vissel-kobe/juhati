Rails.application.routes.draw do
  get 'homes/top'
  get 'labels/index'
  get 'labels/edit'
  get 'genres/index'
  get 'genres/edit'
  get 'artists/index'
  get 'artists/edit'
  get 'sale_histories/index'
  get 'sale_histories/user_history'
  get 'reviews/edit'
  get 'albums/new'
  get 'albums/index'
  get 'albums/show'
  get 'albums/edit'
  get 'admins/edit'
  get 'admins/show'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
