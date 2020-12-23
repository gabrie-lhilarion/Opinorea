class UsersController < ApplicationController
    layout 'application'
    
    def show 
        @user = User.first
    end
end
