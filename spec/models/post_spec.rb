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

    it "投稿内容が100字以内であれば投稿できる" do
      user = create(:user)
      post = build(:post, content: "あるニワトリ小屋で、飼育員が毎日、エサを決まった時間に同じ量だけを与えていた。飼育員は、非常に几帳面な性格だったらしく、何年間も正確に同じことをしていた。さて、小屋の中のニワトリたちは、なぜ、毎日同じ", user_id: user.id)
      expect(post).to be_valid
    end

    it "投稿内容が101字以上であれば投稿できないこと" do
      user = create(:user)
      post = build(:post, content: "あるニワトリ小屋で、飼育員が毎日、エサを決まった時間に同じ量だけを与えていた。飼育員は、非常に几帳面な性格だったらしく、何年間も正確に同じことをしていた。さて、小屋の中のニワトリたちは、なぜ、毎日同じ", user_id: user.id)
      post.valid?
      expect(post.errors[:content])
    end

  end
end