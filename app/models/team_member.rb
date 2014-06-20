# == Schema Information
#
# Table name: team_members
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class TeamMember < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
end
