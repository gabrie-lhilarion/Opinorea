class DislikesController < ApplicationController
  def create
    opinion = Opinion.find(params[:opinion_id])
    user = User.find(params[:user_id])
    dislike = opinion.dislikes.build(user_id: user.id)
    save_dislikes(dislike)
  end

  def is_disliked_or_is_liked?
    opinion = params[:opinion_id]
    user = params[:user_id]
    Dislike.disliked(opinion, user).count.positive? || Like.liked(opinion, user).count.positive?
  end

  def not_disliked_and_not_liked?
    opinion = params[:opinion_id]
    user = params[:user_id]
    Dislike.disliked(opinion, user).count.zero? && Like.liked(opinion, user).count.zero?
  end

  def save_dislikes(l)
    return l.save && (redirect_to root_path, notice: 'Disike was successful.') if not_disliked_and_not_liked?

    return redirect_to root_path,
                       notice: 'Failed, you can\'t dislike twice! and you can\'t like and dislike at once' if is_disliked_or_is_liked?
  end
end
