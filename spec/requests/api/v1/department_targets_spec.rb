require "rails_helper"

RSpec.describe "DepartmentTarget", type: :request do
  describe "GET api/v1/department_targets" do
    subject { get(api_v1_department_targets_path) }
    let!(:company){ create(:company) }
    let!(:department){ create(:department) }
    let!(:a_department){ create(:department) }
    let!(:user){ create(:user, department_id: department.id) }
    before do
      create_list(:department_target,3, department: department)
      create_list(:department_target,2, department: a_department)
    end
    let(:targets){ DepartmentTarget.where(department_id: department.id) }
    let(:a_targets){ DepartmentTarget.where(department_id: a_department.id) }

    context "companyがログインしている時" do
      it "department_target一覧が全て表示される" do
        sign_in company
        subject
        expect(response.body).to include "#{targets[0].monthly_target}" && "#{a_targets[0].monthly_target}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "departmentがログインしている時" do
      it "ログインしているdepartmentのdepartment_target一覧が表示される" do
        sign_in department
        subject
        expect(response.body).to include "#{targets[0].monthly_target}"
        expect(response.body).to not_include "#{a_targets[0].monthly_target}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "userがログインしている時" do
      it "ログインユーザーが所属しているdepartmentのdepartment_target一覧が表示される" do
        sign_in user
        subject
        expect(response.body).to include "#{targets[0].monthly_target}"
        expect(response.body).to not_include "#{a_targets[0].monthly_target}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "ログインしていない時" do
      it "ログインページにリダイレクトする" do
        subject
        expect(response).to redirect_to "http://www.example.com/api/v1/departments/sign_in"
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET api/v1/department_target/:id" do
    subject{ get(api_v1_department_target_path(department_target_id))}
    before do
      sign_in department
    end
    let(:department){ create(:department) }
    let(:department_target){ create(:department_target, department: department) }
    let(:department_target_id){ department_target.id }
    context "指定したidが存在する時" do
      it "指定したtargetが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context "指定したidがない時" do
      let(:department_target_id){ 0 }
      it "エラーする" do
        expect{ subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "GET api/v1/department_targets/new" do
    subject{ get(new_api_v1_department_target_path) }
    let(:department){ create(:department) }
    before do
      sign_in department
    end
    context "departmentがログインしている時" do
      it "department_targetの作成ページが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET api/v1/department_targets/:id/edit" do
    subject{ get(edit_api_v1_department_target_path(department_target_id)) }
    let(:department){ create(:department) }
    before do
      sign_in department
    end
    let(:department_target){ create(:department_target, department: department) }
    let(:department_target_id){department_target.id}
    context "指定したtargetの編集ボタンを押した時" do
      it "指定したtargetの編集ページが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST api/v1/department_targets" do
    subject{ post(api_v1_department_targets_path, params: params)}
    let(:department){ create(:department) }
    before do
      sign_in department
    end
    let(:params){ { department_target: attributes_for(:department_target) } }

    context "項目が入力されている時" do
      it "department_targetは作成されてリダイレクトする" do
        expect { subject }.to change { department.department_targets.count }.by(1)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to "http://www.example.com/api/v1/department_targets/#{ DepartmentTarget.find_by(monthly_target: params[:department_target][:monthly_target]).id}"
      end
    end
  end

  describe "PATCH api/v1/department_targets/:id" do
    subject { patch(api_v1_department_target_path(department_target_id), params: params) }
    before do
      sign_in department
    end
    let(:department){ create(:department) }
    let(:department_target){ create(:department_target, department: department) }
    let(:department_target_id){ department_target.id }
    let(:params){ {department_target: { monthly_target: Faker::Lorem.sentence, created_at: Time.current } } }
    context "指定したdepartment_targetを編集した時" do
      it "department_targetは編集されてリダイレクトする" do
        expect { subject }.to change { DepartmentTarget.find(department_target_id).monthly_target }.from(department_target.monthly_target).to(params[:department_target][:monthly_target]) &
                              not_change { DepartmentTarget.find(department_target_id).created_at } &
                              not_change { DepartmentTarget.find(department_target_id).anually_target } &
                              not_change { DepartmentTarget.find(department_target_id).month } &
                              not_change { DepartmentTarget.find(department_target_id).department }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to "http://www.example.com/api/v1/department_targets/#{department_target_id}"
      end
    end
  end

  describe "DELETE api/v1/department_targets/:id" do
    subject { delete(api_v1_department_target_path(department_target_id))}
    before do
      sign_in department
    end
    let(:department){ create(:department) }
    let!(:department_target){ create(:department_target, department: department) }
    let(:department_target_id){ department_target.id }
    context "指定したdepartment_targetを削除した時" do
      it "department_targetは削除されてリダイレクトする" do
        expect { subject }.to change { department.department_targets.count }.by(-1)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to "http://www.example.com/api/v1/department_targets"
      end
    end
  end
end