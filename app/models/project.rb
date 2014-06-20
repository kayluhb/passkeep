# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  guid       :string(36)       not null
#  name       :string(255)
#  status_id  :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base

  # Concerns
  include Guidable

  STATUSES = {
    Archived: 2,
    Active: 1,
  }

  has_many :entries
  has_many :team_projects
  has_many :teams, through: :team_projects
  has_many :users, -> { uniq }, through: :teams

  attr_accessor :default_team

  before_create :add_to_master_team
  before_validation :sanitize_teams

  validates :name, presence: true

  def default_team=(id)
    self.team_ids = [id]
  end

  def entry_count
    self.entries.count
  end

  def sanitize_teams
    self.team_ids.uniq
  end

  def team_tokens=(ids)
    self.team_ids = ids.split(",")
  end

  def team_tokens
    return self.team_ids.join(',')
  end

  private
    def add_to_master_team
      self.teams << Team.where(master: true)
    end

  class << self

    def ordered
      order("#{self.table_name}.name")
    end

    def skinny
      select(['id', 'guid', 'name', 'updated_at']\
        .collect {|s| "#{self.table_name}.#{s}"}.join(","))
    end

  end
end
