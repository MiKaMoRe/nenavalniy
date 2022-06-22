# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(email: 'admin@didlogic.com', password: 'simplepass', password_confirmation: 'simplepass', type: 'Admin')
cart = Cart.create!(is_order: false, user: admin)
property = Property.create!(name: 'weight')
admin.carts.append

products = Product.create!([
  {
    article: 'AA-31',
    name: ' ТОР-12',
    description: 'Квадрокоптер',
    price: 20000,
    amount: 10
  },
  {
    article: 'AA-240',
    name: 'DJI Mini 2',
    description: 'Квадрокоптер',
    price: 10000,
    amount: 100
  },
  {
    article: 'YRT-124',
    name: 'Autel Robotics EVO',
    description: 'Квадрокоптер',
    price: 3000,
    amount: 300
  },
  {
    article: 'GNH-1',
    name: 'DJI Inspire 2',
    description: 'Квадрокоптер',
    price: 7000,
    amount: 12
  },
  {
    article: 'GNH-1',
    name: 'DJI Inspire 2',
    description: 'Квадрокоптер',
    price: 7000,
    amount: 0
  },
  {
    article: 'GNH-1',
    name: 'DJI Inspire 2',
    description: 'Квадрокоптер',
    price: 7000,
    amount: 123
  },
  {
    article: 'GNH-1',
    name: 'DJI Inspire 2',
    description: 'Квадрокоптер',
    price: 7000,
    amount: 123
  },
  {
    article: 'GNH-1',
    name: 'DJI Inspire 2',
    description: 'Квадрокоптер',
    price: 7000,
    amount: 432
  },
  {
    article: 'GNH-1',
    name: 'DJI Inspire 2',
    description: 'Квадрокоптер',
    price: 7000,
    amount: 234
  },
  {
    article: 'GNH-1',
    name: 'DJI Mavic Air 2',
    description: 'Квадрокоптер',
    price: 15000,
    amount: 154
  }
])

products.each_with_index do |product, index|
  image_num = Random.new.rand(1..5)
  product.image.attach(
    io: File.open(Rails.root.join("app/assets/images/icons/drone#{image_num}.svg")),
    filename: "drone#{image_num}.svg"
  )

  product.products_properties.create!(property: property, value: '20кг')
end

# Add some product to admins cart

admin.carts.active.products.append(products[0])
admin.carts.active.products.append(products[0])
