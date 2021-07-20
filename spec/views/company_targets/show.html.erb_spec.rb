require 'rails_helper'

RSpec.describe "company_targets/show", type: :view do
  before(:each) do
    @company_target = assign(:company_target, CompanyTarget.create!(
      monthly_target: "Monthly Target",
      anually_target: "Anually Target",
      company: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Monthly Target/)
    expect(rendered).to match(/Anually Target/)
    expect(rendered).to match(//)
  end
end
