IngredientRelation.seed do |s|
  s.ingredient = 1
  s.recipe = Recipe.find_by(id: 200)
  s.weight = 1
end