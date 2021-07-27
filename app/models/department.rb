class Department < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users
  has_many :department_targets, dependent: :destroy
  has_many :todo_targets, dependent: :destroy
  belongs_to :company
  validates :departmentname, uniqueness: { case_sensitive: true }, presence: true
end
