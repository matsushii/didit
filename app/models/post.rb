class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, length: {in: 1..100}
  
  def liked_by(user_id)
    likes.where(user_id: user_id).exists?
  end
end