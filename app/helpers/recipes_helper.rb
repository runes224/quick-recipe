module RecipesHelper
  def show_ingredient_name
    # IngredientRelation.find_by(id: value).display_ingredient_name
    @recipe.ingredient_relations.each do |r|
      r.weight
    end
  end
end
