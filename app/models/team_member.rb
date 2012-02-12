# == Schema Information
#
# Table name: team_members
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class TeamMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
end
