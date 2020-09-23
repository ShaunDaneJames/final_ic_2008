require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class RecipeTest < Minitest::Test

  def test_it_exists_with_attributes
    recipe1 = Recipe.new("Mac and Cheese")

    assert_instance_of Recipe, recipe1
    assert_equal "Mac and Cheese", recipe1.name
  end

  def test_starts_with_empty_required_ingredients
    recipe1 = Recipe.new("Mac and Cheese")

    assert_equal ({}), recipe1.ingredients_required
  end

  def test_knows_required_ingredients
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "oz",
      calories: 50
      })
    ingredient2 = Ingredient.new({
      name: "Macaroni",
      unit: "oz",
      calories: 200
      })

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    expected = {
      ingredient1 => 6,
      ingredient2 => 8
    }

    assert_equal expected, recipe1.ingredients_required
  end

  def test_can_list_ingredients
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({
      name: "Cheese",
      unit: "oz",
      calories: 50
      })
    ingredient2 = Ingredient.new({
      name: "Macaroni",
      unit: "oz",
      calories: 200
      })

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    assert_equal [ingredient1, ingredient2], recipe1.ingredients
  end 
end
