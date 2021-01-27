class FollowingsController < ApplicationController
  def create
    followed = User.find(params[:id])
    follow_obj = followed.followings.build(follower_id: current_user.id, follower_name: current_user.fullname)

    if Following.is_a_follower?(followed.id, current_user.id)
      redirect_to root_path, notice: "You are already following @#{followed.username}."
    else
      if follow_obj.save
        redirect_to root_path, notice: "You have followed @#{followed.username} successfully."
      else
        redirect_to user_path(current_user), notice: "Could not follow @#{followed.username}."
      end
    end
  end

  def destroy
    @follower = Following.find(params[:id])
    # @follower_name = @follower.follower_name
    id = @follower.user_id
    followed = User.find(id).fullname
    if @follower.destroy
      redirect_to root_path, notice: "You have unfollowed #{followed} successfully."
    else
      redirect_to root_path, notice: "Could not unfollow @#{followed}!!"
    end
  end
end
