100.times do |i|
  Recipe.seed do |s|
    s.id = i
    s.name = "キーマカレー #{i + 1}"
    s.description = "健康的なキーマカレーです。 #{i + 1}"
    s.user = User.find_by(id: i)
    s.image = File.open("#{Rails.root}/db/curry.jpg")
  end
end