class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)    # Redirect user to items page after login
    :items
  end

end
