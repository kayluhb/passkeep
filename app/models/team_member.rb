# == Schema Information
#
# Table name: team_members
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  team_id    :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class TeamMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  validates :user, :presence => true
  validates :team, :presence => true

end
