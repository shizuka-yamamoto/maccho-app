class ReviewsController < ApplicationController
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

end
