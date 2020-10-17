require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "aaa111", password_confirmation: "aaa111")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "aaa111", password_confirmation: "aaa111")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
