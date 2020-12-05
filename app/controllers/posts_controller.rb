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

  def show
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:id])
  end

  def edit
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to room_post_path
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:id])
    @post.destroy
    redirect_to room_posts_path
  end

  def search
    @room = Room.find(params[:room_id])
    @posts = @room.posts.search(params[:keyword]).includes(:user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :ref_url).merge(room_id: params[:room_id], user_id: current_user.id)
  end
end
