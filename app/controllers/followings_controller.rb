class FollowingsController < ApplicationController
  def create
    followed = User.find(params[:id])

    if Following.not_follower?(followed.id, current_user.id)
      follow_obj = followed.followings.create(follower_id: current_user.id, follower_name: current_user.fullname)
      redirect_to root_path, notice: "You have followed @#{followed.username} successfully."
    else
      redirect_to root_path, notice: "You could not follow @#{followed.username}."
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
