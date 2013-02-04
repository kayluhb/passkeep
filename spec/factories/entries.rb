# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:entry_title) {|n| "Entry #{n}" }

  factory :entry do
    title { generate(:entry_title) }
    project_id 1
    tag_list
  end
end
