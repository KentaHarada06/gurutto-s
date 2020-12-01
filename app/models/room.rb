class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy

  with_options presence: true do
    validates :room_name
    validates :room_description
    validates :owner_id
  end

  def self.search(search)
    if search != ""
      Room.where('room_name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end

end
