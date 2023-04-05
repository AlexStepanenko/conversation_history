# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless session[:user_id]
      redirect_to new_session_path, alert: "You must be logged in to access this page."
    end
  end
end
