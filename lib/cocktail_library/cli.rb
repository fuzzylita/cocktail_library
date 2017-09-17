
class CocktailLibrary::CLI
  
  def initialize
    @bases = CocktailLibrary::BASES
    @cocktail_db = CocktailLibrary::CocktailDB.new
  end 

  def run
    greeting
    base_selection 
    drinks_available
    drink_directions
  end

  def greeting
  puts <<-DOC              


                            /|     /|                            
                          // ( `""-                             
                        \\| /      .\\___                         
                        /        .      4                        
                       /              _ /                        
                      /            .--'                          
                     (              \\                          
                    /               \\ \\                        
                   /            \\ \\  \\                       
        ,         /              \\   \\ \\                       
        )\\      /                \\   \\                        
      \\/  |   .'`   _                \\           \\______/_/        
    \\.   /  .'       '.        ,\\ \\/              \\   (o)/         
  \\'   /   /          \\  ;    |   /                \\  ' /          
  \\'   \\  |           |  |    |  '                  \\  /           
    \\,   `" |           /.|   | |                    ||            
        ''-..-\\      _.;.'|   |.;-.                  ||            
              \\    <`.._ )) |  .;-.))               / \\           
              (__.  `  ))-' \\_    ))'              +++++          
                   `'--"`      `"""`
  DOC

  puts <<~DOC
    Hello there, I am Tiki, your very floofy bartender!
    I'm going to give you a list of drinks based on whatever liquor you have on hand.
    
    What would you like to use for your drink?

    DOC
  end 

  def base_selection
    @bases.each_with_index do |base, index|
      puts "#{index + 1}. #{base}"
    end 
    
    puts ""
    puts "Please enter the number of the base you'd like to use, or enter exit to quit."

    #this is all escapes for incorrect entries or exit
    @base_choice = gets.chomp.downcase
    if @base_choice == "exit"
      puts ""
      puts ""
      puts "Perhaps the smoothie place down the road would be more to your liking."
      exit
    elsif !@bases.include?(@bases[@base_choice.to_i-1]) || @base_choice.to_i < 1
      puts "Ehmm... Our menu is a little limited.. sorry."
      puts "Do you have anything on hand from these options?"
      base_selection
    else
      #this is defining the search object
      @base_type = @bases[@base_choice.to_i-1].downcase
    end 
  end

  def drinks_available
    #this calls the search
    @drinks_list = @cocktail_db.search_by_base(@base_type)
    
    #escape for incorrect entry
    if @drinks_list == nil
      puts "I'm sorry, we have no idea how to make drinks with #{@base_type.gsub(/\w+/) {|word| word.capitalize}}."
      puts "Here is a beer."
      exit(0)
    else
      puts "Here are the drinks you can make with #{@base_type.gsub(/\w+/) {|word| word.capitalize}}:"
      
      puts @drinks_list
    end 
  end 

  def drink_directions 
    puts ""
    puts "Which of these would you like to make?"
    puts ""
    puts "Please enter the drink name, or enter exit if you'd like to leave:"
    puts ""

    drink_selection = gets.chomp.downcase
    #escape if not interested
    if drink_selection == "exit"
      puts ""
      puts "Sorry we couldn't find something you were interested in."
      exit
    #escape if invalid entry
    elsif drink_selection.class != String || @drinks_list.include?(drink_selection) == nil
      puts ""
      puts "Hmm, not sure how to make that one... Sorry about that!"
      puts ""
      drink_directions
    else 
      #take drink selection and push it into the API
      drink = @cocktail_db.drink_components(drink_selection)
      
      puts "One second, let me grab that recipe for you!"
      sleep(1)

      puts ""
      puts "Ok, here how to make your #{drink.name.gsub(/\w+/) {|word| word.capitalize}}:  "
      
      drink.ingredients.each_with_index do |ing, idx|
        puts "#{drink.measurements[idx]}: #{ing}"
      end 
      
      puts "#{drink.instructions}"
      puts ""
      puts "Hope you enjoy it!"
    end 
  end
end