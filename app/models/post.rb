class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, length: {in: 1..100}
  
  def liked_by(current_user)
    likes.where(user_id: current_user.id).exists?
  end
end
