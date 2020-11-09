Rails.application.routes.draw do
  get 'sessions/new'
  get 'tops/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tops#index'
  get '/prefecture/:id', to: 'tops#pref_index'
  get 'show/:id', to: 'tops#show', as: :show
  get '/search', to: 'search_parmacy#search_index', as: :search_pharmacy
  get '/login' , to: 'sessions#new', as: :sign_in
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  namespace :shop do

    get '/new', to: 'top#new'
    get '/dashboard/:id', to: 'top#edit', as: :dashboard
    
  end
  
  namespace :admin do
    root to: 'top#index'
    get 'sign_up', to: 'top#new', as: :new
    post 'create', to: 'top#create'
  end
  
end
