class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:post_id])
    Favorite.create(user_id: current_user.id, room_id: @room.id, post_id: @post.id)
    redirect_to "/rooms/#{params[:room_id]}/posts/#{params[:post_id]}"
  end

  def destroy
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:post_id])
    @favorite = Favorite.find_by(user_id: current_user.id, room_id: @room.id, post_id: @post.id)
    @favorite.destroy
    redirect_to "/rooms/#{params[:room_id]}/posts/#{params[:post_id]}"
  end
end
