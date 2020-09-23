class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def stock_quantity

  end

  def recipe_requiremnt(recipe)
  end


#couldn't get this one to work for the whole,
#but it seemingly works for a part.
#tried to create helper methods but ran out of time.
  def enough_ingredients_for?(recipe)
    enough = false
    recipe.ingredients_required.each do |ingredient, quantity|
      @stock.each do |stock_ingredient, stock_quantity|
        enough = stock_quantity > quantity
      end
    end
    enough
  end
end
