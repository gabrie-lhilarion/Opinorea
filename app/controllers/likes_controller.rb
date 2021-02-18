class LikesController < ApplicationController
  def create 
    opinion = Opinion.find(params[:opinion_id])
    user = User.find(params[:user_id])
    like = opinion.likes.build(user_id: user.id)
  end

end
