require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/todo_targets", type: :request do
  # TodoTarget. As you add validations to TodoTarget, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      TodoTarget.create! valid_attributes
      get todo_targets_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      todo_target = TodoTarget.create! valid_attributes
      get todo_target_url(todo_target)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_todo_target_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      todo_target = TodoTarget.create! valid_attributes
      get edit_todo_target_url(todo_target)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new TodoTarget" do
        expect {
          post todo_targets_url, params: { todo_target: valid_attributes }
        }.to change { TodoTarget.count }.by(1)
      end

      it "redirects to the created todo_target" do
        post todo_targets_url, params: { todo_target: valid_attributes }
        expect(response).to redirect_to(todo_target_url(TodoTarget.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new TodoTarget" do
        expect {
          post todo_targets_url, params: { todo_target: invalid_attributes }
        }.to change { TodoTarget.count }.by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post todo_targets_url, params: { todo_target: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested todo_target" do
        todo_target = TodoTarget.create! valid_attributes
        patch todo_target_url(todo_target), params: { todo_target: new_attributes }
        todo_target.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the todo_target" do
        todo_target = TodoTarget.create! valid_attributes
        patch todo_target_url(todo_target), params: { todo_target: new_attributes }
        todo_target.reload
        expect(response).to redirect_to(todo_target_url(todo_target))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        todo_target = TodoTarget.create! valid_attributes
        patch todo_target_url(todo_target), params: { todo_target: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested todo_target" do
      todo_target = TodoTarget.create! valid_attributes
      expect {
        delete todo_target_url(todo_target)
      }.to change { TodoTarget.count }.by(-1)
    end

    it "redirects to the todo_targets list" do
      todo_target = TodoTarget.create! valid_attributes
      delete todo_target_url(todo_target)
      expect(response).to redirect_to(todo_targets_url)
    end
  end
end
