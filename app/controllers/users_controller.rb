class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :move_root, only: [:edit, :update]

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
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :image)
  end

  def move_root
    redirect_to user_path if current_user.id != params[:id].to_i
  end
end
