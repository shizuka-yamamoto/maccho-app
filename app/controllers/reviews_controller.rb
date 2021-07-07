class ReviewsController < ApplicationController
  before_action :move_to_index

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to user_path(@review.user.id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:text, :achievement_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
