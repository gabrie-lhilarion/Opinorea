class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def create 
    reply = current_user.replies.build( content: params[:content], opinion_id: params[:opinion] )
    
    respend_to  do |format| 
      if reply.save
        format.js {render layout: false}
        format.html { render 'index'}
      else
        format.js {render layout: false}
        format.html { render 'index' }
      end
    end

  end

  def replies_params
    params.permit(:content, :opinion, :user)
  end
end
