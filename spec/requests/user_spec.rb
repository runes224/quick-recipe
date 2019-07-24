require 'rails_helper'

RSpec.describe "User pages", type: :request do
  let(:user) {FactoryBot.create(:user)}
  let(:other_user) {FactoryBot.create(:user)}

  describe "GET #new" do
    # 正常なレスポンスを返すこと
    it "returns http success" do
      get signup_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
  end

  describe "GET #show" do

    # ログイン済みのユーザーとして
    context "as an authenticated user" do
      # 正常なレスポンスを返すこと
      it "responds successfully" do
        sign_in_as user
        get user_path(user)
        expect(response).to be_success
        expect(response).to have_http_status "200"
      end
    end

    # ログインしていないユーザーの場合
    context "as a guest" do
      # ログイン画面にリダイレクトすること
      it "redirects to the login page" do
        get user_path(user)
        expect(response).to redirect_to login_path
      end
    end

    # アカウントが違うユーザーの場合
    context "as other user" do
      before do
        @other_user = FactoryBot.create(:user)
      end

      # ホーム画面にリダイレクトすること
      it "redirects to the login page" do
        sign_in_as @other_user
        get user_path(user)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#edit" do
    context "認可されたユーザーとして" do
      it "編集画面に遷移可能" do
        sign_in_as user
        get edit_user_path(user)
        expect(response).to be_success
        expect(response).to have_http_status "200"
      end
    end

    context "ログインしていないユーザーの場合" do
      it "ログイン画面にリダイレクトすること" do
        get edit_user_path(user)
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_path
      end
    end

    context "アカウントが違うユーザーの場合" do
      it "ログイン画面にリダイレクトすること" do
        sign_in_as other_user
        get edit_user_path(user)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "#update" do
    context "認可されたユーザーとして" do
      it "ユーザーを更新できること" do
        user_params = FactoryBot.attributes_for(:user, name: "NewName")
        sign_in_as user
        patch user_path(user), params: {id: user.id, user: user_params}
        expect(user.reload.name).to eq "NewName"
      end
    end

    context "ログインしていないユーザーの場合" do
      it "ログイン画面にリダイレクトすること" do
        user_params = FactoryBot.attributes_for(:user, name: "NewName")
        patch user_path(user), params: {id: user.id, user: user_params}
        expect(response).to have_http_status "302"
        expect(response).to redirect_to login_path
      end
    end

    context "アカウントが違うユーザーの場合" do
      it "ユーザーを更新できないこと" do
        user_params = FactoryBot.attributes_for(:user, name: "NewName")
        sign_in_as other_user
        patch user_path(user), params: {id: user.id, user: user_params}
        expect(user.reload.name).to eq other_user.name
      end

      it "ホーム画面にリダイレクトすること" do
        user_params = FactoryBot.attributes_for(:user, name: "NewName")
        sign_in_as other_user
        patch user_path(user), params: {id: user.id, user: user_params}
        expect(response).to redirect_to root_path
      end
    end
  end
end