require "rails_helper"

RSpec.describe "DepartmentRegistrations", type: :request do
  describe "POST api/v1/departments" do
    subject { post(api_v1_department_registration_path, params: params) }

    let!(:company) { create(:company) }
    let(:params) { { api_v1_department: attributes_for(:department, company_id: company.id) } }

    it "新規登録されてリダイレクトする" do
      expect { subject }.to change { Department.count }.by(1)
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to "http://www.example.com/api/v1/department_targets"
    end
  end
end
