class Api::V1::TweetLikesController < ApplicationController
  def index
    @tweet_likes = Tweet.includes(:likes).where(likes: { user_id: current_user.id }).order(created_at: "DESC")
  end

  private

    def move_to_signed_in
      unless user_signed_in? || department_signed_in? || company_signed_in?
        redirect_to api_v1_user_session_url
      end
    end
end
