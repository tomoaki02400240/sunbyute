Rails.application.routes.draw do
  get 'sessions/new'
  get 'tops/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tops#index'
  get '/prefecture/:id', to: 'tops#pref_index', as: :pref_index
  get 'show/:id', to: 'tops#show', as: :show
  get '/search', to: 'search_parmacy#search_index', as: :search_pharmacy
  get '/login' , to: 'sessions#new', as: :sign_in
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  namespace :shop do

    get '/new', to: 'top#new'
    post '/create', to: 'top#create', as: :create
    get '/dashboard/:id', to: 'top#dashboard', as: :dashboard
    get 'description/:id', to: 'top#desc', as: :desc
    post 'process/description', to: 'top#descprocess', as: :descprocess
    get 'description/edit/:id', to: 'top#desc_edit', as: :descedit
    post 'description/edit/process', to: 'top#desc_edit_process', as: :desceditprocess
    post 'edit/shop_img/:id', to: 'top#imgprocess', as: :imgprocess
    get 'product', to: 'top#product', as: :product
    post 'create/product', to: 'top#product_process', as: :product_create
    delete 'delete/:id',to: 'top#product_delete', as: :product_delete
    
  end
  
  namespace :admin do
    root to: 'top#index'
    get 'sign_up', to: 'top#new', as: :new
    post 'create', to: 'top#create'
  end
  
end
