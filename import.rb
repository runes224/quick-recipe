require '食品成分インポート用2.csv'

CSV.read("食品成分インポート用2.csv", headers: true).each do |row|
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
