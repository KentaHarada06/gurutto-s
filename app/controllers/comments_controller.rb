class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:post_id])
    @comments = @post.comments.all.includes(:user)
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to room_post_path(@post.room_id, @post.id)
    else
      render('posts/show')
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @post = @room.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to "/rooms/#{@room.id}/posts/#{@post.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
