class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :search]
  before_action :move_root, only: [:destroy]

  def index
    @rooms = Room.all.order(created_at: 'DESC')
    @room = Room.new
    @roomuser = RoomUser.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      render json: { post: @room }
    else
      render json: { post: @room }, status: 422
    end
  end

  def search
    @rooms = Room.search(params[:keyword]).order(created_at: 'DESC')
  end

  def destroy   
    @room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :room_description, user_ids: []).merge(owner_id: current_user.id)
  end
end

def move_root
  @room = Room.find(params[:id])
  redirect_to root_path if current_user.id != @room.owner_id
end