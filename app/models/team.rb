# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  guid       :string(36)       not null
#  master     :boolean          default(FALSE)
#  role_id    :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base

  # Concerns
  include Guidable

  ROLES = {
    Read: 1,
    'Read and edit' => 2,
  }

  # Relations
  has_many :team_members, dependent: :destroy
  has_many :users, -> { order('users.first_name') }, through: :team_members

  has_many :team_projects, dependent: :destroy
  has_many :projects, -> { order('projects.name') }, through: :team_projects

  attr_accessor :project_tokens, :user_tokens

  validates :name, presence: true

  before_destroy :check_for_master

  private

    def check_for_master
      if master
        self.errors[:base] << "cannot delete master lists"
        return false
      end
    end

  class << self
    def editors
      where(role_id: ROLES['Read and edit'])
    end

    def ordered
      order("#{self.table_name}.name")
    end

    def skinny
      select(['id', 'guid', 'name', 'master', 'updated_at']\
        .collect {|s| "#{self.table_name}.#{s}"}.join(","))
    end
  end
end
