class ReviewsController < ApplicationController
  def new
    # find the resto that the review is referring to
    @reviewed_resto = Restaurant.find(params[:restaurant_id])
    # create a blank review instance
    @new_review = @reviewed_resto.reviews.build
  end

  def create
    # create new review
    created_review = Review.new(params.require(:review).permit(:content, :rating))
    created_review.restaurant = Restaurant.find(params[:restaurant_id])

    if created_review.save
      # what happened next
      # get resto instance
      redirect_to restaurant_path(created_review.restaurant)
    else
      render :new
    end
  end
end
