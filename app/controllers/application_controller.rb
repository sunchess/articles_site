class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method "admin?"

  def admin?
    current_user.try(:admin?)
  end

end
