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
  attr_accessible :name, :user_tokens
  attr_reader :user_tokens

  validates :name, :presence => true

  has_many :team_users
  has_many :users, :through => :team_users

  def user_tokens=(ids)
    self.user_ids = ids.split(',')
  end
end
