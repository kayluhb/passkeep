# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:project_name) {|n| "Project #{n}" }

  factory :project do
    name { generate(:project_name) }
  end
end
