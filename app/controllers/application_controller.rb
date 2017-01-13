class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

  helper_method :current_year, :current_user

  private

  def authorize
    redirect_to login_url, alert: t('auth.notauth') if current_user.nil?
  end

  def current_year
    Time.now.year
  end

  def set_locale
    if params[:locale] && I18n.locale_available?(params[:locale])
      I18n.locale = params[:locale]
      session[:locale] = I18n.locale
    elsif session[:locale].present?
      I18n.locale = session[:locale]
    else
      I18n.locale = I18n.default_locale
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
