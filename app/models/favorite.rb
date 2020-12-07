class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :room
  
  validates :user_id, uniqueness: { scope: :post_id }

  def self.favorite_list(favorites)
    posts = []
    favorites.each do |favorite|
      posts << Post.find(favorite.post_id)
    end
    return posts
  end
end
