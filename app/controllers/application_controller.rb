class ApplicationController < ActionController::Base
  before_action :init
  
  def after_sign_in_path_for(resource)    # Redirect user to items page after login
    :items
  end
  
  def init
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
  
end
