require "rails_helper"

RSpec.describe "todos/new", type: :view do
  before do
    assign(:todo, Todo.new(
                    body: "MyString",
                    user: nil,
                  ))
  end

  it "renders new todo form" do
    render

    assert_select "form[action=?][method=?]", todos_path, "post" do
      assert_select "input[name=?]", "todo[body]"

      assert_select "input[name=?]", "todo[user_id]"
    end
  end
end
