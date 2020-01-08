class Recipe
  attr_reader :name, :ingredients_required, :amount_required, :total_calories

  def initialize(name)
    @name = name
    @ingredients_required = {}
    @amount_required = 0
    @total_calories = 0
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
    @amount_required = amount
  end

  def amount_required(ingredient)
    @amount_required
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    total = []
    @ingredients_required.each do |ingredient|
      ingredient.each do |ing|
        total << ing.calories
        # require "pry"; binding.pry
      end
    end
    total.sum
  end
end
