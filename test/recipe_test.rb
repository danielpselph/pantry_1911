require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
# pry(main)> recipe.name
# # => "Mac and Cheese"
#
# pry(main)> recipe.ingredients_required
# # => {}
#
# pry(main)> recipe.add_ingredient(ingredient1, 2)
#
# pry(main)> recipe.add_ingredient(ingredient2, 8)
#
# pry(main)> recipe.ingredients_required
# # => {#<Ingredient:0x00007fd7811553c8...> => 2, #<Ingredient:0x00007fd78110b0e8...> => 8}
#
# pry(main)> recipe.amount_required(ingredient1)
# # => 2
#
# pry(main)> recipe.amount_required(ingredient2)
# # => 8
#
# pry(main)> recipe.ingredients
# # => [#<Ingredient:0x007fe8438c7a70...>, #<Ingredient:0x007fe843857f40...>]
#
# pry(main)> recipe.total_calories
# # => 440
# ```

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
end
