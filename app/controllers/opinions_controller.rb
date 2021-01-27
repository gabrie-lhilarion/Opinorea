class OpinionsController < ApplicationController
  def new
    @opinion = Opinion.new
  end

  def create
    @create_opinion = current_user.opinions.build(opinion_params)
    if @create_opinion.save
      redirect_to root_path, notice: 'Opinion was successfully created.'
    else
      redirect_to root_path, notice: 'Opinion submition failed!.'
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:comment)
  end
end
