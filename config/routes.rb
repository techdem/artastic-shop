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
  
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'
  
  get '/account' => 'orders#index'
  
  get '/cart/clear' => 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  
  get '/checkout' => 'cart#createOrder'
  
  post '/search' => 'items#search'
  
  root :to => 'site#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
