class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :todos, dependent: :destroy
  belongs_to :department
  validates :username, uniqueness: { case_sensitive: true }, presence: true
end
