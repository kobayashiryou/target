class Api::V1::LikesController < ApplicationController
  before_action :move_to_signed_in

  def create
    @like = current_user.likes.new(like_params)
    respond_to do |format|
      if @like.save
        format.html { redirect_to api_v1_tweets_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    current_user.unlike(@tweet)
    respond_to do |format|
      format.html { redirect_to api_v1_tweets_path }
    end
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
