require "rails_helper"

RSpec.describe "company_targets/index", type: :view do
  before do
    assign(:company_targets, [
      CompanyTarget.create!(
        monthly_target: "Monthly Target",
        anually_target: "Anually Target",
        company: nil,
      ),
      CompanyTarget.create!(
        monthly_target: "Monthly Target",
        anually_target: "Anually Target",
        company: nil,
      ),
    ])
  end

  it "renders a list of company_targets" do
    render
    assert_select "tr>td", text: "Monthly Target".to_s, count: 2
    assert_select "tr>td", text: "Anually Target".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
