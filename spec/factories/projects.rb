# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  guid       :string(36)       not null
#  name       :string(255)
#  status_id  :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    guid "MyString"
    name "MyString"
    status_id 1
  end
end
