class AuthenticationController < ApplicationController
  skip_before_action :ensure_current_user

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:destination]
        redirect_to session[:destination]
        session[:destination] = nil # reset
      else
        redirect_to root_path
      end
    else
      @sign_in_error = "Username / password combination is invalid"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
