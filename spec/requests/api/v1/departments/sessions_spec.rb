require "rails_helper"

RSpec.describe "DepartmentSessions", type: :request do
  describe "POST api/v1/departments/sign_in" do
    subject{ post(api_v1_department_session_path, params: params) }

    let(:department){ create(:department) }
    let(:params){ { api_v1_department: { email: department.email, password: department.password } } }
    context "登録済みの情報が入力された時" do
      it "ログインに成功してリダイレクトする" do
        subject
        expect(response).to redirect_to("http://www.example.com/api/v1/department_targets")
        expect(response).to have_http_status(302)
      end
    end

    context "emailが間違っていた時" do
      let(:params){ { api_v1_department: { email: Faker::Internet.email, password: department.password } } }
      it "ログインページのまま(ステータスコード200)" do
        subject
        expect(response).to have_http_status(200)
      end
    end

    context "passwordが間違っていた時" do
      let(:params){ { api_v1_department: { email: department.email, password: Faker::Internet.password(min_length: 6) } } }
      it "ログインページのまま（ステータスコード200）" do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end