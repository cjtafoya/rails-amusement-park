class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new  
  end

  def show
  end

  def create
    @user = User.find_or_create_by(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :tickets, :height, :nausea, :happiness, :admin)
  end
end
