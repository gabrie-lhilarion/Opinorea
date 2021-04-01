class UsersController < ApplicationController
  layout 'application', only: :index
  layout 'profile', only: :show

  def new
    @user = User.new
  end

  def index
    @user = User.new
    @opinion = Opinion.new
    @tofollow = User.who_to_follow(current_user.id)
    @recentopinion = Opinion.all
  end

  def show
    @profile = User.find(params[:id])
    @followed_by = User.followed_by(params[:id])
    @recentopinion = User.recent_opinions(params[:id])
  end
end
