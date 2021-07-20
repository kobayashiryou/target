require "rails_helper"

RSpec.describe "todos/edit", type: :view do
  before do
    @todo = assign(:todo, Todo.create!(
                            body: "MyString",
                            user: nil,
                          ))
  end

  it "renders the edit todo form" do
    render

    assert_select "form[action=?][method=?]", todo_path(@todo), "post" do
      assert_select "input[name=?]", "todo[body]"

      assert_select "input[name=?]", "todo[user_id]"
    end
  end
end