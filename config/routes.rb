Rails.application.routes.draw do
  get 'sessions/new'
  get '/lecture', to: 'static_pages#lecture'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
   get  '/signup',  to: 'users#new'
   get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'static_pages#home'
resources :users
end
