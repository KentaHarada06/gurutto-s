class Post < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :title
    validates :content
  end
end
