module FollowingsHelper
  def me_or_another(follower, current_user)
    if follower.follower_id == current_user.id
      (link_to 'Me', user_path(follower.follower_id))
    else
      (link_to follower.follower_name, user_path(follower.follower_id))
    end
  end

  def follow_or_unfollow(follower, current_user)
    if follower.follower_id == current_user.id
      (link_to '-', unfollow_path(Following.following_record(@profile.id, current_user.id)), title: "Unfollow #{@profile.fullname}")
    else
      (link_to '+', follow_path(follower.follower_id),
               class: 'follow_person', title: "Follow #{follower.follower_name}")
    end
  end
end
