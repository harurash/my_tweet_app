class TweetsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to :root
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end 
  private
  def tweet_params
    params.require(:tweet).permit(:text,:image)
  end 

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
