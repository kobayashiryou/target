require "rails_helper"

RSpec.describe "todo_targets/show", type: :view do
  before do
    @todo_target = assign(:todo_target, TodoTarget.create!(
                                          body: "Body",
                                          department: nil,
                                        ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body/)
    expect(rendered).to match(//)
  end
end
