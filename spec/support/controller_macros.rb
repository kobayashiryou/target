module ControllerMacros
  def login_company(company)
    allow(controller).to receive(:authenticate_company!).and_return(company)
    @request.env["devise.mapping"] = Devise.mappings[:api_v1_company]
    sign_in company
  end

  def login_department(department)
    allow(controller).to receive(:authenticate_department!).and_return(department)
    @request.env["devise.mapping"] = Devise.mappings[:api_v1_department]
    sign_in department
  end

  def login_user(user)
    allow(controller).to receive(:authenticate_user!).and_return(user)
    @request.env["devise.mapping"] = Devise.mappings[:api_v1_user]
    sign_in user
  end
end
