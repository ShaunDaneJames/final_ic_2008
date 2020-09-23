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

end
