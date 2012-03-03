# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  guid       :string(36)      not null
#  name       :string(255)     not null
#  status_id  :integer         default(1), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Project < ActiveRecord::Base

  STATUSES = {
    'Archived' => 2,
    'Active' => 1,
  }

  has_many :entries
  has_many :team_projects
  has_many :teams, :through => :team_projects
  has_many :users, :through => :teams, :uniq => true

  attr_accessible :name, :status_id, :default_team

  before_validation :make_guid

  validates :guid, :presence => true
  validates :name, :presence => true

  attr_accessor :default_team

  def default_team=(id)
    self.team_ids = [id]
  end

  def to_param
    self.guid
  end

  private
    def make_guid
      self.guid = UUIDTools::UUID.random_create.to_s if guid.blank?
    end

  class << self
    def skinny
      select("projects.name, projects.guid, projects.id")
    end

    def ordered
      order("projects.name")
    end

  end

end
