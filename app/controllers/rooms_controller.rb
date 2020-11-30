class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @roomuser = RoomUser.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render new_room_path
    end
  end

  def search
    @rooms = Room.search(params[:keyword])
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
