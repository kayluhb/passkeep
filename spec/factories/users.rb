# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence(:email) {|n| "user#{n}@passkeep.com" }

  factory :user do
    first_name 'Admin'
    last_name 'Istrator'
    email { generate(:email) }
    password 'Passkeep1!'
    super_user false
  end
end
