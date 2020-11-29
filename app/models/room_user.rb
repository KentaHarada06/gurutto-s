class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :room_id
  end
end
