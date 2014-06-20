# == Schema Information
#
# Table name: team_projects
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  project_id :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team_project do
    team nil
    project nil
  end
end
