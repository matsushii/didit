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

    it "パスワードが空では登録ができない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードは入力しても、パスワード確認欄が入力されていないと登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
  end
end