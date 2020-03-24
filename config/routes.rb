# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get '/services', to: 'pages#services', as: 'services'

  namespace :api do
    namespace :v1 do
      resources :frontend do
        member do
          get :car_size
          get :service_type
          post :price
        end
      end
    end
  end
end
