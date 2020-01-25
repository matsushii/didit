require 'rails_helper'
describe User do
  describe '#create' do
    it "ニックネーム、パスワード、パスワード確認用が全て正常に入力されている時" do
      user = build(:user)
      expect(user).to be_valid
    end
    
    it "ニックネームが空では登録ができない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("は1文字以上で入力してください")
    end

  end
end