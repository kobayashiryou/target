class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :todos, dependent: :destroy
  belongs_to :department
  validates :username, uniqueness: { case_sensitive: true }, presence: true

  def self.guest
    company = Company.create!(email: "guest_company@example.com", password: "guestcompany", companyname: "株式会社guest")
    department = Department.create!(email: "guest_department@example.com", password: "guestdepartment", departmentname: "株式会社guest:開発", company_id: company.id)
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "guest"
      user.department_id = department.id
    end
  end
end
