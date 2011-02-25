# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Load up fake data for use in development environment
if Rails.env.development?

  require 'factory_girl'

  Factory.definition_file_paths = [File.join(Rails.root.to_s, 'spec', 'factories')]
  Factory.find_definitions

  # Users
  u = Factory(:user, :email => 'admin@passkeep.com')
  puts "created #{u.email}"
end
