Rails.application.routes.draw do

  devise_for :users
  root 'dashboard#index'

  resources :dictionars

  resources :locations

  resources :provinces

  resources :information do
    collection do
      get "pdf_print"
    end
  end

  resources :users

end
