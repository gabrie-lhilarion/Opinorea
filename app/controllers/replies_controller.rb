class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def create
    @reply = current_user.replies.build(content: params[:content], opinion_id: params[:opinion])
    respond_to do |format|
      if @reply.save
        format.html { redirect_to @reply, notice: 'Reply was succefully created' }
        format.json { render json: @reply, status: :created }
        format.js

      else
        format.html { redirect_to @reply, notice: 'Reply sending failed' }
        format.json { render json: @reply.errors, status: :unprocessable_entity }

      end
    end
  end

  def replies_params
    params.permit(:content, :opinion, :user)
  end
end
