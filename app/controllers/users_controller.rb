class UsersController < ApplicationController
    layout 'application'

    def new
        @user = User.new
    end

    def index 
        @user = User.new
        @opinion = Opinion.new
        @tofollow = @user.who_to_follow
        @recentopinion = @user.recent_conversations
    end



end
