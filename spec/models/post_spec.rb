require 'rails_helper'

describe Post do
  describe "#create" do
    it "投稿ができる" do
      user = create(:user)
      post = build(:post, user_id: user.id)
      expect(post).to be_valid
    end

    it "投稿内容が空だと投稿ができない" do
      user = create(:user)
      post = build(:post, content: "", user_id: user.id)
      post.valid?
      expect(post.errors[:content])
    end
  end
end