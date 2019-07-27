require 'rails_helper'

RSpec.describe 'StaticPages', type: :system do
  describe "ホーム" do
    before do
      visit root_path
    end

    it "ホーム画面に「QuickRecipe」と表示されていること" do
      expect(page).to have_content "QuickRecipe"
    end

    it "タイトルが「ホーム」であること" do
      expect(page).to have_title 'ホーム'
    end
  end

  describe "新規登録" do
    before do
      visit new_user_registration_path
    end

    it "新規登録画面に「アカウントの作成」と表示されていること" do
      expect(page).to have_content "アカウントを作成"
    end

    it "タイトルが「アカウントの作成」であること" do
      expect(page).to have_title 'アカウントの作成'
    end
  end

  describe "ログイン" do
    before do
      visit new_user_session_path
    end

    it "ログイン画面に「ログイン」と表示されていること" do
      expect(page).to have_content "ログイン"
    end

    it "タイトルが「ログイン」であること" do
      expect(page).to have_title 'ログイン'
    end
  end
end