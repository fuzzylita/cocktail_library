
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


end 