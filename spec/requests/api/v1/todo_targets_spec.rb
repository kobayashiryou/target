require "rails_helper"

RSpec.describe "TodoTarget", type: :request do
  describe "GET api/v1/todo_targets" do
    subject { get(api_v1_todo_targets_path) }

    let!(:company) { create(:company) }
    let(:targets) { TodoTarget.where(department_id: department.id) }
    let(:a_targets) { TodoTarget.where(department_id: a_department.id) }
    let!(:department) { create(:department, company: company) }
    let!(:a_department) { create(:department) }
    let!(:user) { create(:user, department_id: department.id) }
    before do
      create_list(:todo_target, 3, department: department)
      create_list(:todo_target, 2, department: a_department)
    end

    context "companyがログインしている時" do
      it "departmentのtodo_target一覧が全て表示される" do
        sign_in company
        subject
        expect(response.body).to include targets[0].body.to_s
        expect(response.body).to not_include a_targets[0].body.to_s
        expect(response).to have_http_status(:ok)
      end
    end

    context "departmentがログインしている時" do
      it "ログインしているdepartmentのtodo_target一覧が表示される" do
        sign_in department
        subject
        expect(response.body).to include targets[0].body.to_s
        expect(response.body).to not_include a_targets[0].body.to_s
        expect(response).to have_http_status(:ok)
      end
    end

    context "userがログインしている時" do
      it "ログインユーザーが所属しているdepartmentのtodo_target一覧が表示される" do
        sign_in user
        subject
        expect(response.body).to include targets[0].body.to_s
        expect(response.body).to not_include a_targets[0].body.to_s
        expect(response).to have_http_status(:ok)
      end
    end

    context "ログインしていない時" do
      it "ログインページにリダイレクトする" do
        subject
        expect(response).to redirect_to "http://www.example.com/api/v1/departments/sign_in"
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "GET api/v1/todo_target/:id" do
    subject { get(api_v1_todo_target_path(todo_target_id)) }

    before do
      sign_in department
    end

    let(:department) { create(:department) }
    let(:todo_target) { create(:todo_target, department: department) }
    let(:todo_target_id) { todo_target.id }
    context "指定したidが存在する時" do
      it "指定したtodo_targetが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context "指定したidがない時" do
      let(:todo_target_id) { 0 }
      it "エラーする" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "GET api/v1/todo_targets/new" do
    subject { get(new_api_v1_todo_target_path) }

    let(:department) { create(:department) }
    before do
      sign_in department
    end

    context "departmentがログインしている時" do
      it "todo_targetの作成ページが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET api/v1/todo_targets/:id/edit" do
    subject { get(edit_api_v1_todo_target_path(todo_target_id)) }

    let(:department) { create(:department) }
    let(:todo_target) { create(:todo_target, department: department) }
    let(:todo_target_id) { todo_target.id }
    before do
      sign_in department
    end

    context "指定したtargetの編集ボタンを押した時" do
      it "指定したtodo_targetの編集ページが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST api/v1/todo_targets" do
    subject { post(api_v1_todo_targets_path, params: params) }

    let(:department) { create(:department) }
    let(:params) { { todo_target: attributes_for(:todo_target) } }
    before do
      sign_in department
    end

    context "項目が入力されている時" do
      it "todo_targetは作成されてリダイレクトする" do
        expect { subject }.to change { department.todo_targets.count }.by(1)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to "http://www.example.com/api/v1/todo_targets/#{TodoTarget.find_by(body: params[:todo_target][:body]).id}"
      end
    end
  end

  describe "PATCH api/v1/todo_targets/:id" do
    subject { patch(api_v1_todo_target_path(todo_target_id), params: params) }

    before do
      sign_in department
    end

    let(:department) { create(:department) }
    let(:todo_target) { create(:todo_target, department: department) }
    let(:todo_target_id) { todo_target.id }
    let(:params) { { todo_target: { body: Faker::Lorem.sentence, created_at: Time.current } } }
    context "指定したtodo_targetを編集した時" do
      it "todo_targetは編集されてリダイレクトする" do
        expect { subject }.to change { TodoTarget.find(todo_target_id).body }.from(todo_target.body).to(params[:todo_target][:body]) &
                              not_change { TodoTarget.find(todo_target_id).created_at } &
                              not_change { TodoTarget.find(todo_target_id).department }
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to "http://www.example.com/api/v1/todo_targets/#{todo_target_id}"
      end
    end
  end

  describe "DELETE api/v1/todo_targets/:id" do
    subject { delete(api_v1_todo_target_path(todo_target_id)) }

    before do
      sign_in department
    end

    let(:department) { create(:department) }
    let!(:todo_target) { create(:todo_target, department: department) }
    let(:todo_target_id) { todo_target.id }
    context "指定したtodo_targetを削除した時" do
      it "todo_targetは削除されてリダイレクトする" do
        expect { subject }.to change { department.todo_targets.count }.by(-1)
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to "http://www.example.com/api/v1/todo_targets"
      end
    end
  end
end
