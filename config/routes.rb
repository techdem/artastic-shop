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
  get '/elevation' => 'user#elevation', as:'elevation'    # Create path for elevation method
  get '/elevation/cancel' => 'user#elevation_cancel', as:'elevation_cancel'    # Create path for elevation cancel
  
  get '/users' => 'user#index'
  get '/approval/:id' => 'user#approval', as:'approval'   # Create path for approval method
  
  get '/owned' => 'user#owned'
  get '/curate' => 'user#curate'
  get '/curate/add/:id' => 'items#curate_approve', as:'curate_approve'    # Create path for curating items
  get '/curate/remove/:id' => 'items#curate_disapprove', as:'curate_disapprove'   # Create path for hidding items
  
  get '/cart/clear' => 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  
  get '/checkout' => 'cart#createOrder'
  
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'
  
  get 'filter/:f' => 'items#filter'   # Create path for filter method
  get '/search/:q' => 'items#search'    # Create path to search by parameter
  post '/search' => 'items#search'

  root :to => 'site#home'
end
