class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_login
    redirect_to sign_in_path, alert: 'Please sign in first.' unless current_user
  end
end
