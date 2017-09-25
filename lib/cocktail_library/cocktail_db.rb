
class CocktailLibrary::CocktailDB
  #this method will use the base selection and return the cocktails made with that base from the DB

  def search_by_base(base)
    #this code returns an object which contains all of the drinks using that base
    base_results = open("http://www.thecocktaildb.com/api/json/v1/1/filter.php?i=#{base}")

    #this code breaks that object (StringIO) into a parsable hash
    #and then it returns a list of the names of the drinks
    drink_names = []

    JSON.load(base_results)['drinks'].each do |k,v|
      k.each do |k, v|
        if k == "strDrink"
          drink_names << v
        end
      end
    end
    drink_names
  end

  def drink_components(drink)
    drink_results = open("http://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{drink}")

    drink_details = JSON.load(drink_results)['drinks'].first.reject do |k,v|
      v == "" || v == " " || v == nil
    end

    instructions = drink_details["strInstructions"]
    ingredients = []
    measurements = []

    drink_details.each do |k,v|
      #the API returns the ingredients and measurements ordered to match the other, so we can be confident that
      #when we add them to an array in order, they will be returned properly
      if k.include?("Ingredient")
        ingredients << v
      end

      if k.include?("Measure")
        measurements << v
      end
    end
    CocktailLibrary::Drink.new(drink, instructions, ingredients, measurements)
  end
end