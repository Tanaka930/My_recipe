class UsersController < ApplicationController

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    @users = User.new
  end

  def update

  end

  def show
    @user = User.find_by(id: params[:id])
    @recipe = Recipe.where(user_id: @user.id)
  end
  
end
