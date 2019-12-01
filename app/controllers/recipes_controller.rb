class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set
  def index
    @recipes = Recipe.where('name LIKE(?) OR text LIKE(?) OR material LIKE(?) OR seasoning LIKE(?) OR time LIKE(?) OR category LIKE(?) OR person LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%").order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      redirect_back(fallback_location: new_recipe_path)
    end
  end

  def show
  end

  def edit

  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    if @recipe.user_id == current_user.id 
      @recipe.destroy
      redirect_to root_path
    else
      redirect_to new_recipe_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :name, 
      :image, 
      :text, 
      :material, 
      :seasoning, 
      :my_text, 
      :time, 
      :category,
      :person,
      :content1,
      :content2,
      :content3,
      :content4
    ).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  
  def set
    Time.zone = 'Tokyo'
  end
end
