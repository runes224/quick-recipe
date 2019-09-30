Direction.seed do |s|
  s.id = 1
  s.recipe = Recipe.find_by(id: 200)
  s.number = 1
  s.content = "たまねぎ・にんじん・にんにくはみじん切りにします"
end

Direction.seed do |s|
  s.id = 2
  s.recipe = Recipe.find_by(id: 200)
  s.number = 2
  s.content = "フライパンにサラダ油・にんにくを入れて中火にかけ、香りが出たらたまねぎ・にんじんを加えて炒めます"
end

Direction.seed do |s|
  s.id = 3
  s.recipe = Recipe.find_by(id: 200)
  s.number = 2
  s.content = "カットトマト・水・「鯖水煮」を缶汁ごと加え、煮立ったらいったん火を止め、カレールウを加えて混ぜます。弱火にし、とろみが出るまで煮ます"
end

Direction.seed do |s|
  s.id = 4
  s.recipe = Recipe.find_by(id: 200)
  s.number = 4
  s.content = "器にサフランライスを盛り付け、（3）をかけ、解凍したグリーンピースを散らします"
end

