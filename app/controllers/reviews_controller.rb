class ReviewsController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail_id = @cocktail.id
    @review.save
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
