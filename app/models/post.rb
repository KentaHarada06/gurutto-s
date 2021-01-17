class Post < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :title, length: { maximum: 60 }
    validates :content, length: { maximum: 30000 }
  end

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%").or(Post.where('content LIKE(?)', "%#{search}%"))
    else
      Post.all
    end
  end
end
