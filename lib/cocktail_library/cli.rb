require 'pry'

class CocktailLibrary::CLI

  def run
    greeting
    base_selection 
    drinks_available
    drink_directions
  end

  def greeting
    puts <<~DOC
    
    Hello there, I am Tiki, your very floofy bartender!
    I'm going to give you a list of drinks based on whatever liquor you have on hand.
    
    What would you like to use for your drink?

    DOC
  end 

  def base_selection
    bases = CocktailLibrary::BASES
    bases.each_with_index do |base, index|
      puts "#{index + 1}. #{base}"
    end 
    
    puts ""
    puts "Please enter the number of the base you'd like to use, or enter exit to quit."

    @base_choice = gets.chomp.downcase
    if @base_choice == "exit"
      puts ""
      puts ""
      puts "Perhaps the smoothie place down the road would be more to your liking."
      exit
    elsif !bases.include?(bases[@base_choice.to_i-1])
      puts "Ehmm... Our menu is a little limited.. sorry."
      puts "Do you have anything on hand from these options?"
      base_selection
    else
      @base_type = bases[@base_choice.to_i-1].downcase
    end 
  end

  def drinks_available
    puts ""
    #display the output of the drink scrape here

    @cocktail_db = CocktailLibrary::CocktailDB.new
    @drinks_list = @cocktail_db.search_by_base(@base_type)
    counter = 1
    
    if @drinks_list == nil
      puts "I'm sorry, we have no idea how to make drinks with #{@base_type.gsub(/\w+/) {|word| word.capitalize}}."
      puts "Here is a beer."
      exit(0)
    else
      puts "Here are the drinks you can make with #{@base_type.gsub(/\w+/) {|word| word.capitalize}}:"
      
      @drinks_list.each do |cocktail, details|
        puts "- #{cocktail.gsub(/\w+/){|word| word.capitalize}}"
      end 
    end 
  end 

  def drink_directions 
    puts ""
    puts "Which of these would you like to make?"
    puts ""
    puts "Please enter the drink name:"
    puts ""

    drink_selection = gets.chomp.downcase
    #the user needs to select one of the options
    #based on that selection, we need to return the right details

    #the list of cocktails and ingredients

    @drinks_list[drinks_selection].each do |direction, specifics|
      puts "#{direction}: #{specifics.join(", ")}"
    end 
  end
end