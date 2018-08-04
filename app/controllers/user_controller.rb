class UserController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def elevation   # Method to request elevation
    current_user.update_attribute(:elevation, true)
    redirect_to :orders
  end
  
  def elevation_cancel   # Method to request elevation
    current_user.update_attribute(:elevation, false)
    redirect_to :orders
  end
  
  def approval    # Method to approve elevation
    User.find(params[:id]).update_attribute(:role, 1)
    User.find(params[:id]).update_attribute(:elevation, false)
    redirect_to :users
  end
  
end
