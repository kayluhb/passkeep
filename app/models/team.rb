# == Schema Information
#
# Table name: teams
#
#  id         :integer         not null, primary key
#  guid       :string(36)      not null
#  name       :string(255)     not null
#  master     :boolean         default(FALSE)
#  role_id    :integer         default(1), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Team < ActiveRecord::Base

  ROLES = {
    'Read' => 1,
    'Read and edit' => 2,
  }

  has_many :team_members
  has_many :team_projects
  has_many :users, through: :team_members, order: 'first_name'
  has_many :projects, through: :team_projects, order: 'name'

  attr_accessible :name, :project_tokens, :user_tokens, :role_id

  before_validation :make_guid
  before_destroy :check_for_master

  validates :guid, presence: true
  validates :name, presence: true

  attr_accessor :project_tokens, :user_tokens

  def to_param
    self.guid
  end

  def project_tokens
    return self.project_ids.join(',')
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

    def make_guid
      self.guid = UUIDTools::UUID.random_create.to_s if guid.blank?
    end

  class << self
    def editable
      where(role_id: ROLES['Read and edit'])
    end

    def ordered
      order("teams.name")
    end
  end
end
