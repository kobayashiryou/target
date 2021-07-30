class Api::V1::Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to api_v1_todos_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
