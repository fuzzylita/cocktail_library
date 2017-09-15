
class CocktailLibrary::CocktailDB
  #this method will use the base selection and return the cocktails made with that base from the DB
  #in the meantime:

  #note to self. This is an instance method not a class method because the results will 
  #depend on the entry from the user
  #that entry will vary every time, so the method should belong to the instance of the 
  #request

=begin
  we need to receive the string value of the numerical entry the user put in 
  we need to use that value to make the request for available drinks with that base
=end 

  @@drinks = {
    "whiskey" => {
      "manhattan" => {
        "ingredients" => ["Whiskey", "Vermouth", "Bitters"],
        "instructions" => ["measure out correct portions and stir, garnish"],
      },
      "vieux carre" => {
        "ingredients" => ["Whiskey", "Brandy", "Vermouth", "Bitters", "Benedictine"],
        "instructions" => ["measure out correct portions and stir, garnish"],
      },
    },
    "rum" => {
      "daiquiri" => {
        "ingredients" => ["Rum", "Lime", "Sweet shit, not too much tho"],
        "instructions" => ["measure out correct portions and shake, garnish"],
      },
      "rum and honey" => {
        "ingredients" => ["Rum", "Honey Syrup", "Orange Bitters"],
        "instructions" => ["measure out correct portions and stir, garnish"],
      },
    },
  }

  def search_by_base(base)
    @@drinks[base]
  end 

end 