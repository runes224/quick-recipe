require 'rails_helper'

RSpec.describe 'ユーザの新規登録', type: :system do

  describe  "新規登録の成功" do
    it  "ユーザーが作成できること" do
      expect{
        visit root_path
        click_link "新規登録"
        fill_in "メールアドレス",     with: "test@example.com"
        fill_in "名前",              with: "Example"
        fill_in "パスワード",         with: "test123"
        fill_in "確認用パスワード",  with: "test123"
        click_button "会員登録する"
      }.to change{ User.count }.by(1)
      expect(page).to have_content "アカウント登録が完了しました"
      expect(current_path).to eq root_path
    end
  end
end