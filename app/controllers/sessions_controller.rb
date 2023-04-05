# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    render 'login'
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now.alert = "Invalid user name."
      render 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully."
  end
end
