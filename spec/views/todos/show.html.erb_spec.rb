require "rails_helper"

RSpec.describe "todos/show", type: :view do
  before do
    @todo = assign(:todo, Todo.create!(
                            body: "Body",
                            user: nil,
                          ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Body/)
    expect(rendered).to match(//)
  end
end
