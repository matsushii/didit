require 'rails_helper'
describe Like do
  describe "#create" do
    it "いいねできる" do
      user = create(:user)
      post = create(:post, user_id: user.id)
      like = build(:like, post_id: post.id, user_id: user.id)
      expect(like).to be_valid
    end
      it "複数回のいいねはできない" do
        user = create(:user)
        post = create(:post, user_id: user.id)
        like = create(:like, post_id: post.id, user_id: user.id)
        like = build(:like, post_id: post.id, user_id: user.id)
        like.valid?
        expect(like.errors)
      end
  end
end