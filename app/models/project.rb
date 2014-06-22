# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  guid          :string(36)       not null
#  name          :string(255)
#  status_id     :integer          default(1)
#  created_at    :datetime
#  updated_at    :datetime
#  entries_count :integer          default(0)
#

class Project < ActiveRecord::Base

  # Concerns
  include Guidable

  STATUSES = {
    Archived: 2,
    Active: 1,
  }

  # Relations
  has_many :entries
  has_many :team_projects
  has_many :teams, through: :team_projects
  has_many :users, -> { uniq }, through: :teams

  # attr_accessor :default_team

  # Validations
  validates :name, presence: true

  # Callbacks
  before_validation :add_to_master_teams

  def default_team=(id)
    self.team_ids = [id]
  end

  private
    def add_to_master_teams
      self.team_ids << Team.where(master: true).pluck('id')
      self.team_ids = self.team_ids.uniq
    end

  class << self

    def ordered
      order("#{self.table_name}.name")
    end

    def skinny
      select(['id', 'guid', 'name', 'entries_count', 'updated_at']\
        .collect {|s| "#{self.table_name}.#{s}"}.join(","))
    end

  end
end
