
# Load data for use in development environment
if Rails.env.development?

  puts "-------------------------------------------------------------------------------"
  puts " Seeding the database"
  puts ""
  puts " You may need to make sure your'e running solr for the factories to work."
  puts " If you see 'Connection refused - connect(2)', run rake `rake sunspot:solr:start`"
  puts "-------------------------------------------------------------------------------"

  require 'factory_girl'

  if Rails.env.development?
    FactoryGirl.definition_file_paths = [File.join(Rails.root.to_s, 'spec', 'factories')]
    FactoryGirl.find_definitions
  end

  # Users
  u = Factory(:user, :email => 'admin@passkeep.com')
  puts "created #{u.email}"

  p = Factory(:project)
  puts "Added a project"

  entries = [];
  until entries.length == 1134
    begin
      e = Factory(:entry,
                  :project_id => 1,
                  :tag_list => (entries.length < 84 ? 'foo, bar, Foo bar' : ''))
      puts "Added an entry"
      entries << e
    rescue $e
      puts "error #{$e}"
    end
  end

  Factory(:team, :project_ids => [1], :user_ids => [1])
end
