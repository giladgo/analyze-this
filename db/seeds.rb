# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_transaction(user, merchant, amount, date)
  user.transactions.create!(
      merchant: merchant, amount: amount, charge_amount: amount, txn_date: date)
end

restaurants = Category.create!(name: 'Restaurants')
groceries = Category.create!(name: 'Groceries')
electronics = Category.create!(name: 'Electronics')
clothing = Category.create!(name: 'Clothing')

vong = Merchant.create!(name: 'Vong', category: restaurants, logo_url: 'https://iic-lunchtime.s3.amazonaws.com/uploads/restaurant/logo/vong.png')
rustico = Merchant.create!(name: 'Rustico', category: restaurants, logo_url: 'https://iic-lunchtime.s3.amazonaws.com/uploads/restaurant/logo/rustico-rothschild.jpg')
cafenoir = Merchant.create!(name: 'Cafe Noir', category: restaurants, logo_url: 'https://iic-lunchtime.s3.amazonaws.com/uploads/restaurant/logo/cafe-noir.gif')
salam = Merchant.create!(name: 'Salam Bombay', category: restaurants, logo_url: 'https://iic-lunchtime.s3.amazonaws.com/uploads/restaurant/logo/salam-bombay.gif')
giraffe = Merchant.create!(name: 'Giraffe', category: restaurants)

sufersal = Merchant.create!(name: 'Sufersal', category: groceries)
ampm = Merchant.create!(name: 'AM/PM', category: groceries)
victory = Merchant.create!(name: 'Victory', category: groceries)

apple = Merchant.create!(name: 'Apple Store', category: electronics)
ksp = Merchant.create!(name: 'KSP', category: electronics)

hm = Merchant.create!(name: 'H&M', category: clothing)
zara = Merchant.create!(name: 'Zara', category: clothing)

user = User.create!(name: 'Ani Ehod', email: 'ani.ehod@gmail.com')

create_transaction(user, vong, 5000, 5.days.ago)
create_transaction(user, rustico, 7500, 2.days.ago)
create_transaction(user, cafenoir, 7500, 1.day.ago)
create_transaction(user, salam, 3000, 6.days.ago)
create_transaction(user, giraffe, 6000, 4.days.ago)

create_transaction(user, sufersal, 30000, 4.days.ago)
create_transaction(user, ampm, 10000, 10.days.ago)
create_transaction(user, victory, 3000, 7.days.ago)

create_transaction(user, apple, 1200000, 20.day.ago)
create_transaction(user, ksp, 15000, 11.day.ago)

create_transaction(user, hm, 17000, 14.day.ago)
create_transaction(user, zara, 20000, 18.day.ago)


create_transaction(user, vong, 5000, 25.days.ago)
create_transaction(user, rustico, 7500, 22.days.ago)
create_transaction(user, cafenoir, 7500, 21.day.ago)
create_transaction(user, salam, 3000, 36.days.ago)
create_transaction(user, giraffe, 6000, 34.days.ago)

create_transaction(user, sufersal, 30000, 44.days.ago)
create_transaction(user, ampm, 10000, 50.days.ago)
create_transaction(user, victory, 3000, 67.days.ago)

create_transaction(user, apple, 12000, 70.day.ago)
create_transaction(user, ksp, 15000, 71.day.ago)

create_transaction(user, hm, 17000, 74.day.ago)
create_transaction(user, zara, 20000, 80.day.ago)


create_transaction(user, vong, 500, 105.days.ago)
create_transaction(user, rustico, 4500, 82.days.ago)
create_transaction(user, cafenoir, 3500, 101.day.ago)
create_transaction(user, salam, 2000, 96.days.ago)
create_transaction(user, giraffe, 1000, 94.days.ago)

create_transaction(user, sufersal, 10000, 94.days.ago)
create_transaction(user, ampm, 20000, 90.days.ago)
create_transaction(user, victory, 1000, 107.days.ago)

create_transaction(user, apple, 1000, 120.day.ago)
create_transaction(user, ksp, 4000, 111.day.ago)

create_transaction(user, hm, 20000, 114.day.ago)
create_transaction(user, zara, 50000, 118.day.ago)


create_transaction(user, vong, 5000, 135.days.ago)
create_transaction(user, rustico, 7500, 132.days.ago)
create_transaction(user, cafenoir, 7500, 131.day.ago)
create_transaction(user, salam, 3000, 136.days.ago)
create_transaction(user, giraffe, 6000, 134.days.ago)

create_transaction(user, sufersal, 30000, 144.days.ago)
create_transaction(user, ampm, 10000, 150.days.ago)
create_transaction(user, victory, 3000, 167.days.ago)

create_transaction(user, apple, 1200000, 170.day.ago)
create_transaction(user, ksp, 15000, 171.day.ago)

create_transaction(user, hm, 17000, 174.day.ago)
create_transaction(user, zara, 20000, 179.day.ago)
