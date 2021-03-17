class OpinionsController < ApplicationController
  layout 'application', only: :show

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

  def show
    @tofollow = User.who_to_follow(current_user.id)
  end

  private

  def opinion_params
    params.require(:opinion).permit(:comment)
  end
end
