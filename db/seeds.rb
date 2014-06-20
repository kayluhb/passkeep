# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = FactoryGirl.create(:user,
  email: 'admin@passkeep.com',
  password: 'Passkeep1!',
  super_user: true
)
puts "created #{u.email}"

FactoryGirl.create(:team, name: "Master", user_ids: [u.id], master: true)
