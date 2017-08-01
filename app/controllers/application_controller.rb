class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

def authorize_user
  if !current_user
    redirect_to '/users/sign_in', notice: 'You must sign in to view that page.'
  end
end
