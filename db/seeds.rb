# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


%w(Matt Rob Kate Ahkeem Dane Justin Karly Jess Bob Bill John Jim Jake January Carl Karl Ken Kyle Derrick)

wines = ["Riesling", "Gewürztraminer", "Chardonnay", "Sauvignon blanc", "Shiraz", "Merlot", "Cabernet Sauvignon", "Pinot Noir"]

User.create!(username: "matt1", password: "password")
User.create!(username: "jane1", password: "password")
User.create!(username: "lyanna1", password: "password")

wines.each do |wine|
  Wine.create!(name: wine)
  Userwine.create!(user_id: rand(1..3), wine_id: wines.index(wine) + 1)
end
