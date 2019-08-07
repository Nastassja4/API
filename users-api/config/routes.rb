Rails.application.routes.draw do
 namespace :api do
   namespace :v1 do
     post 'auth/login', to: 'authentication#authenticate'
     post 'signup', to: 'registrations#create'
     get 'user', to: 'users#show'
     resources :users do
       resources :diaries
     end
     resources :users do
       resources :affirmations
     end
   end
 end
end
