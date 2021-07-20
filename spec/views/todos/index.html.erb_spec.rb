require 'rails_helper'

RSpec.describe "todos/index", type: :view do
  before(:each) do
    assign(:todos, [
      Todo.create!(
        body: "Body",
        user: nil
      ),
      Todo.create!(
        body: "Body",
        user: nil
      )
    ])
  end

  it "renders a list of todos" do
    render
    assert_select "tr>td", text: "Body".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
