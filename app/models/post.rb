class Post < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :title
    validates :content
  end

  def self.search(search)
    if search != ""
      Post.where('content LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
