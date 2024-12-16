class TweetsController < ApplicationController
  def create
    # retrieve session based on token in cookie
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    # retrieve current user based on session
    if session
      user = User.find_by(id: session.user_id)
    end

    # create new tweet associated with current user
    @tweet = user.tweets.new(tweet_params)

    if @tweet.save
      render 'tweets/create'
    end
  end

  def destroy 
    # retrieve tweet by id
    tweet = Tweet.find_by(id: params[:id])
    
    # retrieve session based on token in cookie
    token = cookies.permanent.signed[:twitter_session_token]
    session = Session.find_by(token: token)

    # retrieve current user based on session
    if session
      user = User.find_by(id: session.user_id)
    end

    # if user author of tweet, delete
    if tweet && user && user.id == tweet.user_id && tweet.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def index
    @tweets = Tweet.order(created_at: :desc)
    render 'tweets/index'
  end

  def index_by_user
    # retrieve user based on params
    user = User.find_by(username: params[:username])
    
    # retrieve all tweets by user
    if user
      @tweets = Tweet.where(user_id: user.id)
      render 'tweets/index_by_user'
    end
  end

  private

  def tweet_params
    params.required(:tweet).permit(:message)
  end
end
