require 'rails_helper'

RSpec.describe 'ログイン', type: :system do
  describe "新規登録の成功" do
    let(:user) {FactoryBot.create(:user)}
    describe "有効な情報の場合、ログインに成功すること" do
      login_user(user)

      expect(current_path).to eq root_path
      expect(page).to_not have_content "ログインしました。"
    end

    describe "無効な情報の場合、ログインに失敗すること" do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: ""
      fill_in "パスワード", with: ""
      click_button "ログイン"

      expect(current_path).to eq login_path
      expect(page).to have_content "ログイン"
      expect(page).to have_content "メールアドレスまたはパスワードが違います。"
    end
  end
end