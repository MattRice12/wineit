# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = %w(Matt Rob Kate Ahkeem Dane Justin)

wines = ["Riesling", "Gewürztraminer", "Chardonnay", "Sauvignon blanc", "Shiraz", "Merlot", "Cabernet Sauvignon", "Pinot Noir"]

users.each do |name|
  user = User.new(username: "#{name}1", password: "password")
  user.save
end

wines.each do |wine|
  Wine.create!(name: wine)
  Userwine.create!(user_id: rand(1..6), wine_id: wines.index(wine) + 1)
end
