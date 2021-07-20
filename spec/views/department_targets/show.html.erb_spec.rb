require "rails_helper"

RSpec.describe "department_targets/show", type: :view do
  before do
    @department_target = assign(:department_target, DepartmentTarget.create!(
                                                      monthly_target: "Monthly Target",
                                                      anually_target: "Anually Target",
                                                      department: nil,
                                                    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Monthly Target/)
    expect(rendered).to match(/Anually Target/)
    expect(rendered).to match(//)
  end
end
