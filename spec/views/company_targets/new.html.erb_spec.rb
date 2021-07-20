require "rails_helper"

RSpec.describe "company_targets/new", type: :view do
  before do
    assign(:company_target, CompanyTarget.new(
                              monthly_target: "MyString",
                              anually_target: "MyString",
                              company: nil,
                            ))
  end

  it "renders new company_target form" do
    render

    assert_select "form[action=?][method=?]", company_targets_path, "post" do
      assert_select "input[name=?]", "company_target[monthly_target]"

      assert_select "input[name=?]", "company_target[anually_target]"

      assert_select "input[name=?]", "company_target[company_id]"
    end
  end
end
