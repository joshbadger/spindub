class AuthenticationController < PublicController
  skip_before_action :ensure_logged_in
  before_action :check_session_timeout, only: :create

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:destination]
        redirect_to session[:destination]
        session[:destination] = nil # reset
      else
        redirect_to user_fly_boxes_path(user)
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

  private
    def check_session_timeout
      if session[:destination]
        reset_session if session[:last_seen] < 2.minutes.ago
      end
    end
end
