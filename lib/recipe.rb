class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required.reduce(Hash.new(0)) do |ingredient, amount|
      ingredient[ingredient[0]] = amount[1]
      ingredient
    end
  end
end
