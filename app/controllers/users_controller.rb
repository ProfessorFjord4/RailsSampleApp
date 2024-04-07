class UsersController < ApplicationController
  #ユーザごとのツイートを表示
  def show
    @user = User.find_by(nickname: params[:nickname])
    if(@user)
        @tweets = @user.tweets.order(created_at: "DESC")
    else
        redirect_to request.referer
    end
  end

  #ユーザの一覧を表示
  def index
    @users = User.all
  end
end
