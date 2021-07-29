require "rails_helper"

RSpec.describe "CompanyRegistrations", type: :request do
  describe "POST api/v1/companies" do
    subject { post(api_v1_company_registration_path, params: params) }

    let(:params) { { api_v1_company: attributes_for(:company) } }

    it "新規登録されてリダイレクトする" do
      expect { subject }.to change { Company.count }.by(1)
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to "http://www.example.com/api/v1/company_targets"
    end
  end
end
