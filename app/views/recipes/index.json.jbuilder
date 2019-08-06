json.array! @ingredients do |ingredient|
  # ingredient.nameがjsonデータのnameに代入されます
  # json.〇〇の〇〇がデータから値を取り出す時に使う変数名となります
  json.name ingredient.name
end