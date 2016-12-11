# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

restaurants = Category.create!(name: 'Restaurants', alternate_names: ['מסעדות', 'אירוח', 'פנאי בילוי'])
groceries = Category.create!(name: 'Groceries', alternate_names: ['מזון'])
electronics = Category.create!(name: 'Electronics')
clothing = Category.create!(name: 'Clothing', alternate_names: ['ביגוד'])
fuel = Category.create!(name: 'Fuel', alternate_names: ['דלק'])
department_stores = Category.create!(name: 'Department Stores', alternate_names: ['בתי כלבו', 'ובלכ יתב'])
furniture = Category.create!(name: 'Furniture', alternate_names: ['ריהוט ובית'])
health = Category.create!(name: 'Health', alternate_names: ['רפואה'])
insurance = Category.create!(name: 'Insurance', alternate_names: ['ביטוח'])
tourism = Category.create!(name: 'Tourism', alternate_names: ['תיירות'])
communication = Category.create!(name: 'Communication', alternate_names: ['תקשורת'])
