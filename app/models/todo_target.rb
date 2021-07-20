class TodoTarget < ApplicationRecord
  belongs_to :department
  has_many :todos, dependent: :destroy
  validates :body, presence: true
end
