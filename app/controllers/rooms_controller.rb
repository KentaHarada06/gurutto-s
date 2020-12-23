class RoomsController < ApplicationController
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
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit(:room_name, :room_description, user_ids: []).merge(owner_id: current_user.id)
  end
end
