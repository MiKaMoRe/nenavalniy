# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create!([
  {
    article: 'AA-31',
    name: 'Балдеж Полетеж',
    price: 20000,
    amount: 10
  },
  {
    article: 'AA-240',
    name: 'Балдеж Низкополетеж',
    price: 10000,
    amount: 100
  },
  {
    article: 'YRT-124',
    name: 'Балдежный Балдеж',
    price: 3000,
    amount: 300
  },
  {
    article: 'GNH-1',
    name: 'Летный Балдеж',
    price: 7000,
    amount: 0
  }
])
