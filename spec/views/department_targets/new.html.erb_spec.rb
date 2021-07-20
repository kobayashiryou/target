require 'rails_helper'

RSpec.describe "department_targets/new", type: :view do
  before(:each) do
    assign(:department_target, DepartmentTarget.new(
      monthly_target: "MyString",
      anually_target: "MyString",
      department: nil
    ))
  end

  it "renders new department_target form" do
    render

    assert_select "form[action=?][method=?]", department_targets_path, "post" do

      assert_select "input[name=?]", "department_target[monthly_target]"

      assert_select "input[name=?]", "department_target[anually_target]"

      assert_select "input[name=?]", "department_target[department_id]"
    end
  end
end
