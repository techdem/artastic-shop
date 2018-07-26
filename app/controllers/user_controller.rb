class UserController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def elevation
    current_user.update_attribute(:elevation, true)
    redirect_to :items
  end
  
  def approval
    User.find(params[:id]).update_attribute(:role, 1)
    User.find(params[:id]).update_attribute(:elevation, false)
    redirect_to :users
  end
  
end
