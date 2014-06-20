class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!, :set_time_zone

    # 404
  unless Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from AbstractController::ActionNotFound, with: :render_404
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end


  private

    def render_404
      error_message = "404 - No route matches \"#{request.env["PATH_INFO"]}\"" +
                      " with {host: \"#{request.env["HTTP_HOST"]}\"," +
                      " method: :#{request.request_method}}"
      logger.error "\n" + error_message + "\n\n"
      respond_to do |format|
        format.html { render 'shared/404', status: :not_found }
        format.all { render text: '404: Not Found', status: :not_found }
      end
    end

  protected

    def set_time_zone
      Time.zone = current_user.time_zone if user_signed_in?
    end
end
