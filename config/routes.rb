Rails.application.routes.draw do
  namespace :shop do
    get "shop_contents/des"
  end
  get "sessions/new"
  get "tops/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tops#index"
  get "/prefecture/:id", to: "tops#pref_index"
  get "show/:id", to: "tops#show", as: :show
  get "/search", to: "search_parmacy#search_index", as: :search_pharmacy
  get "/login", to: "sessions#new", as: :sign_in
  post "/login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  namespace :shop do
    get "/new", to: "top#new"
    get "/dashboard/:id", to: "top#dashboard", as: :dashboard
    post "/create", to: "top#create", as: :create
    get "/des/:id", to: "shop_contents#des", as: :des
    post "/des/create", to: "shop_contents#create", as: :des_create
    get "des/edit/:id", to: "shop_contents#edit", as: :des_edit
    post "des/update/:id", to: "shop_contents#update", as: :des_update
    get "new/avatar", to: "shop_contents#avatar", as: :avatar
    post "create/avatar", to: "shop_contents#avatar_process", as: :avatar_process
  end

  namespace :admin do
    root to: "top#index"
    get "sign_up", to: "top#new", as: :new
    post "create", to: "top#create"
  end
end
