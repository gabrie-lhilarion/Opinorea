class LikesController < ApplicationController
  def create 
    opinion = Opinion.find(params[:opinion_id])
    user = User.find(params[:user_id])
    like = opinion.likes.build(user_id: user.id)
    save_like(like)
  end

  def not_liked_or_disliked?
    opinion = params[:opinion_id]
    user = params[:user_id]
    Like.liked(opinion, user).count.zero? && Dislike.disliked(opinion, user).count.zero?
  end

  def liked_or_disliked?
    opinion = params[:opinion_id]
    user = params[:user_id]
    Like.liked(opinion, user).count.positive? || Dislike.disliked(opinion, user).count.positive?
  end

  def save_like(l)
    return l.save && (redirect_to root_path, notice: 'Like was successful.')  if not_liked_or_disliked?
    return redirect_to root_path, notice: 'Like submition failed, you can\'t like twice! and you can\'t like and dislike at the same time' if liked_or_disliked?
  end
end
