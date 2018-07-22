class UserController < ApplicationController

    def login
            session[:login] = 1
            session[:cart] = nil
            flash[:notice] = "Welcome Admin!"
            redirect_to :controller => :items
    end
    
    def logout
        session[:login] = nil
        session[:cart] = nil
        flash[:notice] = "You have logged out!"
        redirect_to :controller => :items
    end
end
