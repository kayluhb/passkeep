# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  guid       :string(36)       not null
#  master     :boolean          default(FALSE)
#  role_id    :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name "MyString"
    guid "MyString"
    master false
    role_id 1
  end
end
