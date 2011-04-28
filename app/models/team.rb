# == Schema Information
# Schema version: 20110428145853
#
# Table name: teams
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
end
