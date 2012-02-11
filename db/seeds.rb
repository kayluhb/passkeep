
# Load data for use in development environment
if Rails.env.development?

  puts "-------------------------------------------------------------------------------"
  puts " Seeding the database"
  puts ""
  puts " Please make sure your'e running solr for the factories to work.'"
  puts " run rake `rake sunspot:solr:start` or you may get 'Connection refused - connect(2)'"
  puts "-------------------------------------------------------------------------------"

  require 'factory_girl'

  if Rails.env.development?
    FactoryGirl.definition_file_paths = [File.join(Rails.root.to_s, 'spec', 'factories')]
    FactoryGirl.find_definitions
  end

  # Users
  u = Factory(:user, :email => 'admin@passkeep.com')
  puts "created #{u.email}"
end
