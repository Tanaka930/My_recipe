# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  def detail
      @recipes = Recipe.where(user_id: current_user.id)
    @user = User.find_by(id: params[:id])
  end
  
  # protected
  
  # ここのコメントアウトを外してリダイレクト先を指定
  # ルートパス名でも良い
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    "/user/#{current_user.id}"
  end


end
