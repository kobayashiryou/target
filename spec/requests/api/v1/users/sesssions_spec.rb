require "rails_helper"

RSpec.describe "UserSessions", type: :request do
  describe "POST api/v1/users/sign_in" do
    subject { post(api_v1_user_session_path, params: params) }

    let(:user) { create(:user) }
    let(:params) { { api_v1_user: { email: user.email, password: user.password } } }
    context "登録済みの情報が入力された時" do
      it "ログインに成功してリダイレクトする" do
        subject
        expect(response).to redirect_to("http://www.example.com/api/v1/todos")
        expect(response).to have_http_status(:found)
      end
    end

    context "emailが間違っていた時" do
      let(:params) { { api_v1_user: { email: Faker::Internet.email, password: user.password } } }
      it "ログインページのまま(ステータスコード200)" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context "passwordが間違っていた時" do
      let(:params) { { api_v1_user: { email: user.email, password: Faker::Internet.password(min_length: 6) } } }
      it "ログインページのまま（ステータスコード200）" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
