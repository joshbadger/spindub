class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_logged_in


  helper_method :current_user

  class AccessDenied < StandardError
  end

  rescue_from AccessDenied, with: :render_404

  def render_404
    render 'public/404', status: 404, layout: false
  end

  private
    def current_user
      user = User.find_by(id: session[:user_id])
    end

    def ensure_logged_in
      unless current_user
        session[:destination] = params
        session[:last_seen] = Time.now
        redirect_to signin_path, alert: 'You must be logged in to do that'
      end
    end
end
