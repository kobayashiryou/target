require 'rails_helper'

RSpec.describe "department_targets/index", type: :view do
  before(:each) do
    assign(:department_targets, [
      DepartmentTarget.create!(
        monthly_target: "Monthly Target",
        anually_target: "Anually Target",
        department: nil
      ),
      DepartmentTarget.create!(
        monthly_target: "Monthly Target",
        anually_target: "Anually Target",
        department: nil
      )
    ])
  end

  it "renders a list of department_targets" do
    render
    assert_select "tr>td", text: "Monthly Target".to_s, count: 2
    assert_select "tr>td", text: "Anually Target".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
