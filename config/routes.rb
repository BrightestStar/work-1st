Rails.application.routes.draw do

  root 'dashboard#index'

  resources :dictionars

  resources :locations

  resources :provinces

  resources :information

end
