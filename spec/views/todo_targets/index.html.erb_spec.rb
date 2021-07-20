require 'rails_helper'

RSpec.describe "todo_targets/index", type: :view do
  before(:each) do
    assign(:todo_targets, [
      TodoTarget.create!(
        body: "Body",
        department: nil
      ),
      TodoTarget.create!(
        body: "Body",
        department: nil
      )
    ])
  end

  it "renders a list of todo_targets" do
    render
    assert_select "tr>td", text: "Body".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
