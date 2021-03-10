class FollowingsController < ApplicationController
  def create
    followed = User.find(params[:id])
    
    if Following.following(current_user).include?(followed)
      redirect_to root_path, notice: "You are already following @#{followed.username}."
    else
      followed.followings.create(follower_id: current_user.id, follower_name: current_user.fullname)
      redirect_to user_path(followed), notice: "You have followed @#{followed.username} successfully."
    end
  end

  def destroy
    @follower = Following.find_by(id: params[:id]) 
     
    if @follower.destroy
      redirect_to root_path, notice: "Unfollow was successfully."
    else
      redirect_to root_path, notice: "Unfollow was not successfull!"
    end
  end
end
