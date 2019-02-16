require 'seeuletter'

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

  seeuletter = Seeuletter::Client.new(api_key: "test_a79f021b-4b8f-4bc4-ac86-9d3493f371d5")
  puts seeuletter.letters.create(
  description: "Test letter from the Ruby Wrapper",
  to: {
    name: 'Erlich',
    address_line1: '30 rue de rivoli',
    address_line2: '',
    address_city: 'Paris',
    address_country: 'France',
    address_postalcode: '75004'
  },
  source_file: '<html>Hello {{name}}</html>',
  source_file_type: 'html',
  postage_type: 'prioritaire',
  variables: { name: 'Erlich'},
  color: 'color'
)
  def letter
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end


