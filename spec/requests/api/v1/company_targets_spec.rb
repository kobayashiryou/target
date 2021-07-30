require "rails_helper"

RSpec.describe "CompanyTarget", type: :request do
  describe "GET api/v1/company_targets" do
    subject { get(api_v1_company_targets_path) }

    let(:company) { create(:company) }
    let(:a_company) { create(:company) }
    let(:department) { create(:department, company: company) }
    let(:user) { create(:user, department: department) }
    let(:targets) { CompanyTarget.where(company_id: company.id) }
    let(:a_targets) { CompanyTarget.where(company_id: a_company.id) }
    before do
      create_list(:company_target, 3, company: company)
      create_list(:company_target, 2, company: a_company)
    end

    context "companyがログインしている時" do
      it "ログインしているcompanyの一覧が表示される" do
        sign_in company
        subject
        expect(response.body).to include targets[0].monthly_target.to_s
        expect(response.body).to not_include a_targets[0].monthly_target.to_s
        expect(response).to have_http_status(:ok)
      end
    end

    context "departmentがログインしている時" do
      it "departmentが所属するcompanyの一覧が表示される" do
        sign_in department
        subject
        expect(response.body).to include targets[0].monthly_target.to_s
        expect(response.body).to not_include a_targets[0].monthly_target.to_s
        expect(response).to have_http_status(:ok)
      end
    end

    context "userがログインしている時" do
      it "userが所属するcompanyの一覧が表示される" do
        sign_in user
        subject
        expect(response.body).to include targets[0].monthly_target.to_s
        expect(response.body).to not_include a_targets[0].monthly_target.to_s
        expect(response).to have_http_status(:ok)
      end
    end

    context "ログインしていない時" do
      it "ログインページにリダイレクトする" do
        subject
        expect(response).to redirect_to "http://www.example.com/api/v1/companies/sign_in"
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "GET api/v1/company_target/:id" do
    subject { get(api_v1_company_target_path(company_target_id)) }

    before do
      sign_in company
    end

    let(:company) { create(:company) }
    let(:company_target) { create(:company_target, company: company) }
    let(:company_target_id) { company_target.id }
    context "指定したidが存在する時" do
      it "指定したtargetが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context "指定したidがない時" do
      let(:company_target_id) { 0 }
      it "エラーする" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "GET api/v1/company_targets/new" do
    subject { get(new_api_v1_company_target_path) }

    let(:company) { create(:company) }
    before do
      sign_in company
    end

    context "companyがログインしている時" do
      it "company_targetの作成ページが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET api/v1/company_targets/:id/edit" do
    subject { get(edit_api_v1_company_target_path(company_target_id)) }

    let(:company) { create(:company) }
    let(:company_target) { create(:company_target, company: company) }
    let(:company_target_id) { company_target.id }
    before do
      sign_in company
    end

    context "指定したtargetの編集ボタンを押した時" do
      it "指定したtargetの編集ページが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST api/v1/company_targets" do
    subject { post(api_v1_company_targets_path, params: params) }

    let(:company) { create(:company) }
    let(:params) { { company_target: attributes_for(:company_target) } }
    before do
      sign_in company
    end

    context "項目が入力されている時" do
      it "company_targetは作成されてリダイレクトする" do
        expect { subject }.to change { company.company_targets.count }.by(1)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to "http://www.example.com/api/v1/company_targets/#{CompanyTarget.find_by(monthly_target: params[:company_target][:monthly_target]).id}"
      end
    end
  end

  describe "PATCH api/v1/company_targets/:id" do
    subject { patch(api_v1_company_target_path(company_target_id), params: params) }

    before do
      sign_in company
    end

    let(:company) { create(:company) }
    let(:company_target) { create(:company_target, company: company) }
    let(:company_target_id) { company_target.id }
    let(:params) { { company_target: { monthly_target: Faker::Lorem.sentence, created_at: Time.current } } }
    context "指定したcompany_targetを編集した時" do
      it "company_targetは編集されてリダイレクトする" do
        expect { subject }.to change {
                                CompanyTarget.find(company_target_id).monthly_target
                              }.from(company_target.monthly_target).to(params[:company_target][:monthly_target]) &
                              not_change { CompanyTarget.find(company_target_id).created_at } &
                              not_change { CompanyTarget.find(company_target_id).anually_target } &
                              not_change { CompanyTarget.find(company_target_id).month } &
                              not_change { CompanyTarget.find(company_target_id).company }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to "http://www.example.com/api/v1/company_targets/#{company_target_id}"
      end
    end
  end

  describe "DELETE api/v1/company_targets/:id" do
    subject { delete(api_v1_company_target_path(company_target_id)) }

    before do
      sign_in company
    end

    let(:company) { create(:company) }
    let!(:company_target) { create(:company_target, company: company) }
    let(:company_target_id) { company_target.id }
    context "指定したcompany_targetを削除した時" do
      it "company_targetは削除されてリダイレクトする" do
        expect { subject }.to change { company.company_targets.count }.by(-1)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to "http://www.example.com/api/v1/company_targets"
      end
    end
  end
end
