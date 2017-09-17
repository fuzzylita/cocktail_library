module CocktailLibrary
  BASES = ["Whiskey", "Bourbon", "Scotch", "Applejack", "Cognac", "Rum", "Gin", "Tequila", "Brandy"].sort!
end 

require 'open-uri'
require 'json'
require_relative './cocktail_library/version'
require_relative './cocktail_library/cli'
require_relative './cocktail_library/cocktail_db'
require_relative './cocktail_library/drink.rb'

