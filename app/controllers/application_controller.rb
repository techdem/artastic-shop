class ApplicationController < ActionController::Base
  before_action :init
  
  def after_sign_in_path_for(resource)    # Redirect user to items page after login
    :root
  end
  
  def init
    @history = Item.all
    @ordered = Orderitem.all
    if session[:cart] then
      @incart = session[:cart]
    else
      @incart = {}
    end
  end
end
