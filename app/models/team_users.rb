# == Schema Information
# Schema version: 20110428145853
#
# Table name: team_users
#
#  id         :integer(4)      not null, primary key
#  team_id    :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class TeamUsers < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
end
