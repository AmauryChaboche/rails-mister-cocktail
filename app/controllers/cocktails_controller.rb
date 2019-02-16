require 'seeuletter'

class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [ :show ]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else render :new
    end
  end

  def show
    # @doses = Dose.where(cocktail_id: @cocktail.id)
  end


  def letter
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

  @letter = seeuletter.letters.list
  end
  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :doses, :ingredients, :photo, :reviews)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
