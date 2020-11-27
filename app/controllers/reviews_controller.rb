class ReviewsController < ApplicationController
  def show; end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      flash[:notice] = 'review succesfully added'
      redirect_to restaurant_path(@review.restaurant_id)
    else
      flash[:alert] = 'invalid review'
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
