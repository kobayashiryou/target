require "rails_helper"

RSpec.describe "Todo", type: :request do
  describe "GET api/v1/todos" do
    subject { get(api_v1_todos_path) }
    let!(:company){ create(:company) }
    let!(:department){ create(:department) }
    let!(:user){ create(:user, department_id: department.id) }
    let!(:a_user){ create(:user) }
    before do
      create_list(:todo,3, user: user)
      create_list(:todo,2, user: a_user)
    end
    let(:todos){ Todo.where(user_id: user.id) }
    let(:a_todos){ Todo.where(user_id: a_user.id) }

    context "companyがログインしている時" do
      it "todo一覧が全て表示される" do
        sign_in company
        subject
        expect(response.body).to include "#{todos[0].body}" && "#{a_todos[0].body}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "departmentがログインしている時" do
      it "ログインしているdepartmentに所属しているユーザーのtodo一覧が表示される" do
        sign_in department
        subject
        expect(response.body).to include "#{todos[0].body}"
        expect(response.body).to not_include "#{a_todos[0].body}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "userがログインしている時" do
      it "ログインユーザーのtodo一覧が表示される" do
        sign_in user
        subject
        expect(response.body).to include "#{todos[0].body}"
        expect(response.body).to not_include "#{a_todos[0].body}"
        expect(response).to have_http_status(:ok)
      end
    end

    context "ログインしていない時" do
      it "ログインページにリダイレクトする" do
        subject
        expect(response).to redirect_to "http://www.example.com/api/v1/users/sign_in"
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "GET api/v1/todo/:id" do
    subject{ get(api_v1_todo_path(todo_id))}
    before do
      sign_in user
    end
    let(:user){ create(:user) }
    let(:todo){ create(:todo, user: user) }
    let(:todo_id){ todo.id }
    context "指定したidが存在する時" do
      it "指定したtodoが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end

    context "指定したidがない時" do
      let(:todo_id){ 0 }
      it "エラーする" do
        expect{ subject }.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "GET api/v1/todos/new" do
    subject{ get(new_api_v1_todo_path) }
    let(:user){ create(:user) }
    before do
      sign_in user
    end
    context "userがログインしている時" do
      it "todoの作成ページが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "GET api/v1/todos/:id/edit" do
    subject{ get(edit_api_v1_todo_path(todo_id)) }
    let(:user){ create(:user) }
    before do
      sign_in user
    end
    let(:todo){ create(:todo, user: user) }
    let(:todo_id){todo.id}
    context "指定したtodoの編集ボタンを押した時" do
      it "指定したtodoの編集ページが表示される" do
        subject
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe "POST api/v1/todos" do
    subject{ post(api_v1_todos_path, params: params)}
    let(:user){ create(:user) }
    let(:todo_target){ create(:todo_target) }
    before do
      sign_in user
    end
    let(:params){ { todo: attributes_for(:todo, todo_target_id: todo_target.id) } }

    context "項目が入力されている時" do
      it "todoは作成されてリダイレクトする" do
        expect { subject }.to change { user.todos.count }.by(1)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to "http://www.example.com/api/v1/todos/#{ Todo.find_by(body: params[:todo][:body]).id}"
      end
    end
  end

  describe "PATCH api/v1/todos/:id" do
    subject { patch(api_v1_todo_path(todo_id), params: params) }
    before do
      sign_in user
    end
    let(:user){ create(:user) }
    let(:todo){ create(:todo, user: user) }
    let(:todo_id){ todo.id }
    let(:params){ {todo: { body: Faker::Lorem.sentence, created_at: Time.current } } }
    context "指定したtodoを編集した時" do
      it "todoは編集されてリダイレクトする" do
        expect { subject }.to change { Todo.find(todo_id).body }.from(todo.body).to(params[:todo][:body]) &
                              not_change { Todo.find(todo_id).created_at } &
                              not_change { Todo.find(todo_id).user }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to "http://www.example.com/api/v1/todos/#{todo_id}"
      end
    end
  end

  describe "DELETE api/v1/todos/:id" do
    subject { delete(api_v1_todo_path(todo_id))}
    before do
      sign_in user
    end
    let(:user){ create(:user) }
    let!(:todo){ create(:todo, user: user) }
    let(:todo_id){ todo.id }
    context "指定したtodoを削除した時" do
      it "todoは削除されてリダイレクトする" do
        expect { subject }.to change { user.todos.count }.by(-1)
        expect(response).to have_http_status(302)
        expect(response).to redirect_to "http://www.example.com/api/v1/todos"
      end
    end
  end
end