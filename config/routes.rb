Rails.application.routes.draw do
  get '/lecture', to: 'static_pages#lecture'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'static_pages#home'
end
