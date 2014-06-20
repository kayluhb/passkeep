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

class TeamProject < ActiveRecord::Base
  belongs_to :team
  belongs_to :project
end
