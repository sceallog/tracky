Rails.application.routes.draw do
  post 'users/edit', to: 'users#update'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'signup' },
                     controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
