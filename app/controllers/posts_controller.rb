class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_root, only: [:edit, :destroy]

  def index
    @room = Room.find(params[:room_id])
    @posts = @room.posts.all.includes(:user).order(created_at: 'DESC')
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
    @comment = Comment.new
    @comments = @post.comments.all.includes(:user)
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
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
    redirect_to room_post_path
  end

  def search
    @room = Room.find(params[:room_id])
    @posts = @room.posts.search(params[:keyword]).includes(:user).order(created_at: 'DESC')
  end

  def favorite
    @room = Room.find(params[:room_id])
    @favorites = @room.favorites.where(user_id: current_user.id).order(created_at: 'DESC')
    @posts = Favorite.favorite_list(@favorites)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :ref_url).merge(room_id: params[:room_id], user_id: current_user.id)
  end

  def move_root
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    redirect_to root_path if current_user.id != @user.id
  end
end
