class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :todos, dependent: :destroy
  has_many :tweets, dependent: :destroy
  belongs_to :department
  validates :username, uniqueness: { case_sensitive: true }, presence: true
  mount_uploader :image, UserUploader
  def self.guest
    guestcompany = Company.find_or_create_by!(email: "guest_company@example.com") do |company|
      company.password = "guestcompany"
      company.companyname = "株式会社guest"
    end
    guestdepartment = Department.find_or_create_by!(email: "guest_department@example.com") do |department|
      department.password = "guestdepartment"
      department.departmentname = "株式会社guest:開発"
      department.company_id = guestcompany.id
    end
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "guest"
      user.department_id = guestdepartment.id
    end
  end
end
