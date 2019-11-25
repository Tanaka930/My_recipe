class UsersController < ApplicationController

  def edit

  end

  def update

  end

  def show
    @user = User.find_by(id: params[:id])
    @users = User.new
  end
  

  def index
    @users = User.all
  end
end
