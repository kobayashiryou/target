json.extract! todo_target, :id, :body, :department_id, :created_at, :updated_at
json.url todo_target_url(todo_target, format: :json)
