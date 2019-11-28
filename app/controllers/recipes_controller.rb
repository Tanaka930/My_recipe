class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def  new
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

  def edit

  end

  def update

  end

  def destroy

  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
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
end
