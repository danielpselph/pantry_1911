require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test

 def setup
   @ingredient1 = Ingredient.new("Cheese", "C", 100)
   @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
   @recipe = Recipe.new("Mac and Cheese")
 end

 def test_it_exists
   assert_instance_of Recipe, @recipe
 end

 def test_it_has_attributes
   assert_equal "Mac and Cheese", @recipe.name
   assert_equal ({}), @recipe.ingredients_required
 end

 def test_can_add_ingredients
   @recipe.add_ingredient(@ingredient1, 2)
   @recipe.add_ingredient(@ingredient2, 8)
   assert_equal ({@ingredient1 => 2, @ingredient2 => 8}), @recipe.ingredients_required
 end

 def test_can_check_amount_required
   @recipe.add_ingredient(@ingredient1, 2)
   assert_equal 2, @recipe.amount_required(@ingredient1)
   @recipe.add_ingredient(@ingredient2, 8)
   assert_equal 8, @recipe.amount_required(@ingredient2)
 end

 def test_can_check_ingredients
   @recipe.add_ingredient(@ingredient1, 2)
   @recipe.add_ingredient(@ingredient2, 8)
   assert_equal [@ingredient1, @ingredient2], @recipe.ingredients
 end

 def test_it_can_return_total_calories
   @recipe.add_ingredient(@ingredient1, 2)
   @recipe.add_ingredient(@ingredient2, 8)
   # require "pry"; binding.pry
   assert_equal 440, @recipe.total_calories
 end
end
