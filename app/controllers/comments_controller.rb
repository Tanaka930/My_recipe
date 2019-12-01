class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set
  before_action :set_recipe

  def create
    @comment = @recipe.comments.new(comment_params)
    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to root_path
    end
  end

  def destroy
    @comment = @recipe.comments.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_back(fallback_location: recipe_path)
    else
      redirect_to root_path
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set
    Time.zone = 'Tokyo'
  end

end
