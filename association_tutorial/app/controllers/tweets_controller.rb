class TweetsController < ApplicationController
  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
  before_action :authenticate_user!, except: [:index]
  
  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.all.order(id: "DESC")
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end

  def create
    #  フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
    @tweet = Tweet.new(tweet_params)
    # deviseのメソッドを使って「ログインしている自分のid」を代入
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  private
    def tweet_params
        # tweetモデルのカラムのみを許可
        params.require(:tweet).permit(:body, :image)
    end

end
