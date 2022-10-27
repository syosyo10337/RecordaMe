Rails.application.routes.draw do
  resources :items, only: [:index, :edit, :update]
  get '/about', to: 'static_pages#about'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  get '/users', to: 'users#index'

  root 'static_pages#home'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
