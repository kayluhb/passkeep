# == Schema Information
#
# Table name: teams
#
#  id         :integer         not null, primary key
#  guid       :string(36)      not null
#  name       :string(255)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Team < ActiveRecord::Base

  has_many :team_members
  has_many :team_project
  has_many :users, :through => :team_members
  has_many :projects, :through => :team_projects

  attr_accessible :name

  before_validation :make_guid

  validates :guid, :presence => true
  validates :name, :presence => true

  def to_param
    self.guid
  end

  private
    def make_guid
      self.guid = UUIDTools::UUID.random_create.to_s if guid.blank?
    end
end
