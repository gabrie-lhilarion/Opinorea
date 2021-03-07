class DislikesController < ApplicationController
  def create
    opinion = Opinion.find(params[:opinion_id])
    user = User.find(params[:user_id])
    dislike = opinion.dislikes.build(user_id: user.id)
    save_dislikes(dislike)
  end

  def disliked_or_is_liked?
    opinion = params[:opinion_id]
    user = params[:user_id]
    Dislike.disliked(opinion, user).count.positive? || Like.liked(opinion, user).count.positive?
  end

  def not_disliked_and_not_liked?
    opinion = params[:opinion_id]
    user = params[:user_id]
    Dislike.disliked(opinion, user).count.zero? && Like.liked(opinion, user).count.zero?
  end

  def save_dislikes(likes)
    if (not_disliked_and_not_liked?)
      likes.save
      redirect_to root_path, notice: 'Disike was successful.'
    else
      redirect_to root_path, notice: 'Failed, either like or dislike' if disliked_or_is_liked?
    end
  end
end
