require "rails_helper"

RSpec.describe "department_targets/edit", type: :view do
  before do
    @department_target = assign(:department_target, DepartmentTarget.create!(
                                                      monthly_target: "MyString",
                                                      anually_target: "MyString",
                                                      department: nil,
                                                    ))
  end

  it "renders the edit department_target form" do
    render

    assert_select "form[action=?][method=?]", department_target_path(@department_target), "post" do
      assert_select "input[name=?]", "department_target[monthly_target]"

      assert_select "input[name=?]", "department_target[anually_target]"

      assert_select "input[name=?]", "department_target[department_id]"
    end
  end
end
