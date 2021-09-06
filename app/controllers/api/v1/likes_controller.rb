class Api::V1::LikesController < ApplicationController
  before_action :move_to_signed_in

  def create
    @tweet = Tweet.find(params[:tweet])
    current_user.like(@tweet)
  end

  def destroy
    @tweet = Like.find(params[:id]).tweet
    current_user.unlike(@tweet)
  end

  private

    def like_params
      params.require(:likes).permit(:tweet_id)
    end

    def move_to_signed_in
      unless user_signed_in? || department_signed_in? || company_signed_in?
        redirect_to api_v1_user_session_url
      end
    end
end
