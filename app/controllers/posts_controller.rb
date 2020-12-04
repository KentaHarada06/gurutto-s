class PostsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @posts = @room.posts.all.includes(:user)
  end

  def new
    @post = Post.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @post = @room.posts.new(post_params)
    if @post.save
      redirect_to room_posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :ref_url).merge(room_id: params[:room_id], user_id: current_user.id)
  end
end
