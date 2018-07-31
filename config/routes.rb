Rails.application.routes.draw do
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  
  resources :orders do
    resources:orderitems
  end
  
  devise_for :users do
    resources:orders
  end
  
  get 'cart/index'
  resources :items
  
  root 'static_pages#home'
  
  get '/account' => 'orders#index'    # Create path for account page that displays order history
  get '/elevation' => 'user#elevation', as:'elevation'
  
  get '/users' => 'user#index'
  get '/approval/:id' => 'user#approval', as:'approval'
  
  get '/cart/clear' => 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  
  get '/checkout' => 'cart#createOrder'
  
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'
  
  get '/search/:q' => 'items#search'
  post '/search' => 'items#search'

  root :to => 'site#home'
end
