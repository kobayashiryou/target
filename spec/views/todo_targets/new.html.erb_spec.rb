require "rails_helper"

RSpec.describe "todo_targets/new", type: :view do
  before do
    assign(:todo_target, TodoTarget.new(
                           body: "MyString",
                           department: nil,
                         ))
  end

  it "renders new todo_target form" do
    render

    assert_select "form[action=?][method=?]", todo_targets_path, "post" do
      assert_select "input[name=?]", "todo_target[body]"

      assert_select "input[name=?]", "todo_target[department_id]"
    end
  end
end
