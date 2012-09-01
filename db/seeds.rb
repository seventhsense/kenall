# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'

CSV.foreach("db/real_ken_all.csv") do |row|
  h = {
    zip: row[0],
    address: row[1],
    address_kana: row[2]
  }
  p h
  Postcode.create!(h)
end
