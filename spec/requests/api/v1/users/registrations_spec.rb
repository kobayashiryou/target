require "rails_helper"

RSpec.describe "UserRegistrations", type: :request do
  describe "POST api/v1/users" do
    subject{ post(api_v1_user_registration_path, params: params) }
    let!(:department){ create(:department) }
    let(:params){ {api_v1_user: attributes_for(:user, department_id: department.id) } }


    it "新規登録されてリダイレクトする" do
      expect { subject }.to change { User.count }.by(1)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to "http://www.example.com/api/v1/todos"
    end
  end
end