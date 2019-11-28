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
    @user = User.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
