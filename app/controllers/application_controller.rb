class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_year

  def current_year
    Time.now.year
  end
end
