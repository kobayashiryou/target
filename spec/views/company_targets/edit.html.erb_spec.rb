require "rails_helper"

RSpec.describe "company_targets/edit", type: :view do
  before do
    @company_target = assign(:company_target, CompanyTarget.create!(
                                                monthly_target: "MyString",
                                                anually_target: "MyString",
                                                company: nil,
                                              ))
  end

  it "renders the edit company_target form" do
    render

    assert_select "form[action=?][method=?]", company_target_path(@company_target), "post" do
      assert_select "input[name=?]", "company_target[monthly_target]"

      assert_select "input[name=?]", "company_target[anually_target]"

      assert_select "input[name=?]", "company_target[company_id]"
    end
  end
end
