class ApplicationController < ActionController::Base
  alias_method :current_company, :current_api_v1_company
  alias_method :authenticate_company!, :authenticate_api_v1_company!
  alias_method :current_department, :current_api_v1_department
  alias_method :authenticate_department!, :authenticate_api_v1_department!
  alias_method :current_user, :current_api_v1_user
  alias_method :authenticate_user!, :authenticate_api_v1_user!

  def home; end

  def after_sign_in_path_for(resource)
    if current_company
      api_v1_company_targets_path # ログイン後に遷移するpathを設定
    elsif current_department
      api_v1_department_targets_path
    elsif current_user
      api_v1_todos_path
    end
  end
end
