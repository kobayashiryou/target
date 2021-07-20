require "rails_helper"

RSpec.describe "todo_targets/edit", type: :view do
  before do
    @todo_target = assign(:todo_target, TodoTarget.create!(
                                          body: "MyString",
                                          department: nil,
                                        ))
  end

  it "renders the edit todo_target form" do
    render

    assert_select "form[action=?][method=?]", todo_target_path(@todo_target), "post" do
      assert_select "input[name=?]", "todo_target[body]"

      assert_select "input[name=?]", "todo_target[department_id]"
    end
  end
end
