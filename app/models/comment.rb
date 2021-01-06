class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  with_options presence: true do
    validates :message, length: { maximum: 1000 }
  end
end
