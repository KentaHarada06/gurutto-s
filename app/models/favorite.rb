class Favorite < ApplicationRecord
  belongs_to :favorite
  belongs_to :user
  
  validates :user_id, uniqueness: { scope: :favorite_id }
end
