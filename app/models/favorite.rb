class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :room
  
  validates :user_id, uniqueness: { scope: :post_id }
end
