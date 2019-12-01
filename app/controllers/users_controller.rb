class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only:[ :show, :edit, :update]

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(id: current_user.id)
    respond_to do |format|
      format.html
      format.json
    @user = User.all
    end
  end

  def edit
    # @user = User.find_by(id: params[:id])
    # @users = User.new
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @recipe = Recipe.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :name, 
      :icon, 
      :prof,
      :birthday,
      :gender
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

end
