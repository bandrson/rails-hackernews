class UsersController < ApplicationController
  def index
    @users = User.order(karma: :desc).page(params[:page]).per(28)
  end

  def show
    @user = User.find(params[:id])
  end
end
