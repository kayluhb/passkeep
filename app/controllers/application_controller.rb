class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :set_time_zone

  # 404
  unless Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ActionController::UnknownAction, with: :render_404
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected
    def set_time_zone
      Time.zone = current_user.time_zone if user_signed_in?
    end
end
