# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence(:team_name) {|n| "Team #{n}" }

  factory :team do
    name { generate(:team_name) }
    user_ids []
    project_ids []
    master false
  end
end
