class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :favorites

  with_options presence: true do
    validates :room_name, length: { maximum: 20 }
    validates :room_description, length: { maximum: 40 }
    validates :owner_id
  end

  def self.search(search)
    if search != ''
      Room.where('room_name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
