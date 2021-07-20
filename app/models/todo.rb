class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :todo_target
  validates :body, presence: true
end
