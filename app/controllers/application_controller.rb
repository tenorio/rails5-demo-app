class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

  helper_method :current_year

  def current_year
    Time.now.year
  end

  private

  def set_locale
    if params[:locale] && I18n.locale_available?(params[:locale])
      I18n.locale = params[:locale]
    else
      I18n.locale = I18n.default_locale
    end
  end
end
