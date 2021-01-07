class RoomUsersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    @roomuser = RoomUser.new(roomuser_params)
    @roomuser.save
    redirect_to root_path
  end

  def destroy
    roomuser = RoomUser.find_by(user_id: current_user.id, room_id: params[:id])
    roomuser.destroy
    redirect_to root_path
  end

  private

  def roomuser_params
    params.require(:room_user).permit(:user_id, :room_id)
  end
end
