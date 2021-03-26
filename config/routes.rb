Rails.application.routes.draw do
  post 'users/edit', to: 'users#update'
  put 'users/edit', to: 'users#update'
  get 'search', to: 'search#search'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'signup' },
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :projects do
    resources :tickets, shallow: true do
      resources :comments, only: %i[create destroy]
    end
  end

  namespace :admin do
    get 'admin/users', to: 'admin/users#index'
    resources :users
  end

  resources :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
