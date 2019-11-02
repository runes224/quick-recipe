IngredientRelation.seed do |s|
  s.ingredient = 1
  s.recipe = Recipe.find_by(id: 200)
  s.weight = 11
  s.display_weight = 1
  s.display_name = "唐辛子"
end