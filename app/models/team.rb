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

  def project_tokens
    self.project_ids.join(',')
  end

  def project_tokens=(ids)
    self.project_ids = ids.split(",")
  end

  def user_tokens=(ids)
    self.user_ids = ids.split(",")
  end

  def user_tokens
    return self.user_ids.join(',')
  end

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
  end
end
