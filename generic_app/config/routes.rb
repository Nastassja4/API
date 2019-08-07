Rails.application.routes.draw do
  resources :users do
    resources :diaries
  end
  resources :users do
    resources :affirmations
  end
  resources :users, only: [:signup, :login, :home]
  root "users#login_page"
  post 'users/signup', to: 'users#signup', as: 'signup'
  post 'users/login', to: 'users#login', as: 'login'
  get 'users/show', to: 'users#show', as: 'show'
  get 'users/signup_page', to: 'users#signup_page'
end
