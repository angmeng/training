Rails.application.routes.draw do
  resources :users
  resources :payments, only: [ :new, :create ]
  resources :admins
  get 'sign_up', to: 'sign_up#new'
  post 'sign_up', to: 'sign_up#create'
  get  'login', to: "login#new"
  post 'login', to: "login#create"
  get  'admin/login', to: "login#admin_login"
  post 'admin/login', to: "login#create_admin_session"
  delete 'admin/logout', to: "login#destroy_admin_session"
  delete 'logout', to: "login#destroy"
  
  resources :orders do
    resources :order_items, only: [ :update, :destroy ] do
      collection do
        patch "update_all"
      end
    end
    
    collection  do
      post :create_order_items
    end
    member do
      
    end
  end
  resources :customers
  resources :orderings, only: [ :index ] do
    collection do
      post "order"
      get  "checkout"
      post "update_order_items"
    end
    
    member do
      delete "decrement_quantity"
      put "increment_quantity"
    end
    
  end
  resources :menu_items
  resources :categories
  
  namespace :api do
    resources :menu_items
    resources :orders do
      collection do
      end
    end
  end
  
  root "orderings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
