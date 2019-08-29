# frozen_string_literal: true

require 'csv'
# encoding: utf-8

CSV.foreach('db/食品成分インポート用5.csv', headers: true).each do |row|
  ingredient = Ingredient.create!(
    name: row['name'],
    group: row['group'],
    calorie: row['calorie'],
    carbohydrate: row['carbohydrate'],
    protein: row['protein'],
    lipid: row['lipid'],
    salt: row['salt']
  )
end

Recipe.create!(
  [
    {
      recipe_id: '1',
      number: '1',
      content: 'フライパンを温める'
    },
    {
      recipe_id: '2',
      number: '2',
      content: '卵を入れる'
    }
  ]
)

Direction.create!(
  [
    {
      recipe_id: '1',
      number: '1',
      content: 'フライパンを温める'
    },
    {
      recipe_id: '2',
      number: '2',
      content: '卵を入れる'
    }
  ]
)

IngredientRelation.create!(
  [
    {
      ingredient_id: '2046',
      recipe_id: '1',
      weight: '15',
      display_weight_name: '大さじ１',
      display_ingredient_name: 'しょうゆ'
    },
    {
      ingredient_id: '1694',
      recipe_id: '1',
      weight: '200',
      display_weight_name: '１枚',
      display_ingredient_name: '鶏肉'
    }
  ]
)
Recipe.create!(
  name: '鶏の照り焼き',
  description: '美味しいです',
  user_id: '1'
)
User.create!(
  name: 'テスト太郎',
  email: 'example@mail.com',
  password: 'password'
)
