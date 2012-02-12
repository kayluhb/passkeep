# == Schema Information
#
# Table name: teams
#
#  id         :integer         not null, primary key
#  guid       :string(36)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Team < ActiveRecord::Base

  before_validation :make_guid

  has_many :team_members
  has_many :team_project
  has_many :users, :through => :team_members
  has_many :projects, :through => :team_projects

  def to_param
    self.guid
  end

  private
    def make_guid
      self.guid = UUIDTools::UUID.random_create.to_s if guid.blank?
    end
end
