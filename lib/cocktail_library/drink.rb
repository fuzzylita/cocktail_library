#will use drink_details from cli.rb

class CocktailLibrary::Drink
  attr_accessor :name, :instructions, :ingredients, :measurements

  def initialize(name, instructions, ingredients, measurements)
    @name = name
    @instructions = instructions
    @ingredients = ingredients 
    @measurements = measurements
  end  

end 