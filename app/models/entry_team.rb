# == Schema Information
# Schema version: 20110428150706
#
# Table name: entry_teams
#
#  id         :integer(4)      not null, primary key
#  entry_id   :integer(4)
#  team_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class EntryTeam < ActiveRecord::Base
  belongs_to :entry
  belongs_to :team
end
