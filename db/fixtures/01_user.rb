100.times do |i|
  User.seed do |s|
    s.id = i
    s.email = "sampleuser#{i}@example.com"
    s.name = "Example#{i}"
    s.password = "password#{i}"
    s.password_confirmation = "password#{i}"
  end
end