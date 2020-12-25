class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: current_user.id).order(created_at: 'DESC')
    @favorite_posts = Favorite.favorite_list(@favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :image)
  end
end
