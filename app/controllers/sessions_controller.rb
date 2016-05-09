class SessionsController < ApplicationController
  def create
    session[:user_id] = params[:user][:id]
    redirect_to user_path(params[:user][:id])
  end
end
