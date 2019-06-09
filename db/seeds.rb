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
    salt: row['salt'],
  )
end
