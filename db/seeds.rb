# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
maui = Flight.create!(number: "707", airline: "United" destination: "Maui", international?: false)
nyc = Flight.create!(number: "423", airline: "Southwest" destination: "Maui", international?: false)
columbus = Flight.create!(number: "890", airline: "American" destination: "Maui", international?: false)
dc = Flight.create!(number: "398", airline: "Frontier" destination: "Maui", international?: false)
cancun = Flight.create!(number: "524", airline: "Delta" destination: "Maui", international?: true)

cindi = maui.passengers.create!(name: "Cindi", age: "63", gold_status?: true)
harry = maui.passengers.create!(name: "Harry", age: "35", gold_status?: false)
larry = maui.passengers.create!(name: "Larry", age: "28", gold_status?: true)
mary = maui.passengers.create!(name: "Mary", age: "18", gold_status?: false)
