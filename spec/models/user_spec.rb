require 'rails_helper'
describe User do
  describe '#create' do
    it "ニックネーム、パスワード、パスワード確認用が全て正常に入力されている時" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end
  end
end