class LikesController < ApplicationController
  def create
    opinion = Opinion.find(params[:opinion_id])
    user = User.find(params[:user_id])
    like = opinion.likes.build(user_id: user.id)
    save_like(like)
  end

  def not_liked_and_not_disliked?
    opinion = params[:opinion_id]
    user = params[:user_id]
    Like.liked(opinion, user).count.zero? && Dislike.disliked(opinion, user).count.zero?
  end

  def liked_or_disliked?
    opinion = params[:opinion_id]
    user = params[:user_id]
    Like.liked(opinion, user).count.positive? || Dislike.disliked(opinion, user).count.positive?
  end

  def save_like(like)
    if not_liked_and_not_disliked?
      like.save
      redirect_to root_path, notice: 'Like was successful.'
    elsif liked_or_disliked?
      redirect_to root_path, notice: 'Failed, either like or dislike'
    end
  end
end
