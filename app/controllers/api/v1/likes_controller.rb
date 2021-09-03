class Api::V1::LikesController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_like, only: %i[destroy]

  def create
    @like = current_user.likes.create!(like_params)
  end

  def destroy
    @like.destroy!
  end

  private
    def like_params
      params.require(:like).permit(:user_id, :tweet_id)
    end

    def set_like
      @like = Like.find(params[:id])
    end

    def move_to_signed_in
      unless user_signed_in? || department_signed_in? || company_signed_in?
        redirect_to api_v1_user_session_url
      end
    end
end