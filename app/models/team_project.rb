# == Schema Information
#
# Table name: team_projects
#
#  id         :integer         not null, primary key
#  project_id :integer
#  team_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class TeamProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :team
end
