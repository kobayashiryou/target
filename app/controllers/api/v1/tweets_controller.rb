class Api::V1::TweetsController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_tweet, only: %i[show, edit, update, destroy]

  def index
    if current_user
      @tweets = Tweet.where(user_id: current_user.id)
    end
  end

  def show
  end

  def new
    @tweet = current_user.tweets.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [:api, :v1, @tweet], notice: "投稿しました" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @tweet = current_user.tweets.update(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [:api, :v1, ], notice: "投稿を編集しました" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet.destroy!
    respond_to do |format|
      format.html { redirect_to api_v1_todos_url, notice: "Todo was successfully destroyed." }
    end
  end

  private

  def set_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body, :image)
  end

  def move_to_signed_in
    unless user_sign_in? || department_signed_in? || company_signed_in?
      redirect_to api_v1_user_session_url
    end
  end

end