require "rails_helper"

RSpec.describe "CompanySessions", type: :request do
  describe "POST api/v1/companies/sign_in" do
    subject { post(api_v1_company_session_path, params: params) }

    let(:company) { create(:company) }
    let(:params) { { api_v1_company: { email: company.email, password: company.password } } }
    context "登録済みの情報が入力された時" do
      it "ログインに成功してリダイレクトする" do
        subject
        expect(response).to redirect_to("http://www.example.com/api/v1/company_targets")
        expect(response).to have_http_status(:found)
      end
    end

    context "emailが間違っていた時" do
      let(:params) { { api_v1_company: { email: Faker::Internet.email, password: company.password } } }
      it "ログインページのまま(ステータスコード200)" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context "passwordが間違っていた時" do
      let(:params) { { api_v1_company: { email: company.email, password: Faker::Internet.password(min_length: 6) } } }
      it "ログインページのまま（ステータスコード200）" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
