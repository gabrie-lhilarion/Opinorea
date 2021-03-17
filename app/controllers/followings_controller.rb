class FollowingsController < ApplicationController
  def create
    followed = User.find(params[:id])
    following = followed.followings.build(follower_id: current_user.id, follower_name: current_user.fullname)

    if Following.a_follower?(followed.id, current_user.id)
      redirect_to root_path, notice: "You are already following @#{followed.username}."
    elsif following.save
      redirect_to root_path, notice: "You have followed @#{followed.username} successfully."
    else
      redirect_to user_path(current_user), notice: "Could not follow @#{followed.username}."
    end
  end

  def destroy
    @follower = Following.find(params[:id]) 
    id = @follower.user_id
    followed = User.find(id).fullname
    if @follower.destroy
      redirect_to root_path, notice: "You have unfollowed #{followed} successfully."
    else
      redirect_to root_path, notice: "Could not unfollow @#{followed}!!"
    end
  end
end
