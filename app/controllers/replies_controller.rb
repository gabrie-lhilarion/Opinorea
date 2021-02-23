class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def create 
    reply = current_user.replies.build( content: params[:content], opinion_id: params[:opinion] )
    if reply.save
      redirect_to root_path, notice: 'Reply was successfully saved.'
    else
      redirect_to root_path, notice: 'Reply submition failed!.'
    end
  end

  def replies_params
    params.permit(:content, :opinion, :user)
  end
end
