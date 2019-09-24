IngredientRelation.seed do |s|
  s.ingredient = 1
  s.recipe = Recipe.find_by(id: 200)
  s.number = 1
  s.content = "たまねぎ・にんじん・にんにくはみじん切りにします"
end