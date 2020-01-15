class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, length: {in: 1..50}
end
