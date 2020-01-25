require 'rails_helper'

describe Post do
  describe "#create" do
    it "投稿ができる" do
      user = create(:user)
      post = build(:post, user_id: user.id)
      expect(post).to be_valid
    end
  end
end