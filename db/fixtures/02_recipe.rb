100.times do |i|
  Recipe.seed do |s|
    s.id = i
    s.name = "キーマカレー。 #{i + 1}"
    s.description = "健康的なキーマカレーです #{i + 1}"
    s.user = User.find_by(id: i)
    s.image = File.open("#{Rails.root}/db/curry.jpg")
  end
end

Recipe.seed do |s|
  s.id = 200
  s.name = "鯖水煮カレー"
  s.description = "鯖を食べてDHA・EPAを摂取しましょう。カレー味なので魚臭さがなく、お子さんにもおすすめです!!!!!！"
  s.user = User.find_by(id: 1)
  s.image = File.open("#{Rails.root}/db/saba_curry.jpg")
end