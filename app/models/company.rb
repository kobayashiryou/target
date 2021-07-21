class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :departments, dependent: :destroy
  has_many :company_targets, dependent: :destroy
  validates :companyname, uniqueness: { case_sensitive: true }, presence: true
end
