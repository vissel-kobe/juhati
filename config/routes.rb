Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  
  resources:users, only:[:index, :show, :edit, :update]
  resources:artists, only:[:index, :edit, :create, :update, :destroy]
  resources:albums do
    resources:reviews, only:[:edit, :create, :update, :destroy]
    resource:favorites, only:[:create, :destroy]
  end
  resources:labels, only:[:index, :edit, :create, :update, :destroy]
  resources:genres, only:[:index, :edit, :create, :update, :destroy]
  resources:orders, only:[:create, :update, :destroy]
  resources:sale_histories, only:[:index, :user_history, :create]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
