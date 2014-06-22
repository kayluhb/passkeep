# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  guid                   :string(36)       not null
#  time_zone              :string(255)      default("Eastern Time (US & Canada)")
#  super_user             :boolean          default(FALSE)
#  administrator          :boolean          default(FALSE)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base

  # Concerns
  include Guidable

  # Include default devise modules. Others available are:
  # :registerable, :confirmable and :omniauthable
  devise :database_authenticatable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relations
  has_many :team_members
  has_many :teams, through: :team_members
  has_many :projects, -> { uniq }, through: :teams
  has_many :entries, through: :projects

  validates :first_name, :last_name, presence: true

  def admin?
    super_user || administrator
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.first_name = split.first
    self.last_name = split.last
  end

  def can_edit?(project)
    return true if project.new_record?
    user_teams = self.teams.editors.pluck(:id)
    project_teams = project.teams.editors.pluck(:id)
    (user_teams & project_teams).length > 0
  end

  def can_view?(project)
    self.projects.include? project
  end

  protected
    def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end

  class << self

    def ordered
      order("#{self.table_name}.last_name, #{self.table_name}.first_name")
    end

    def skinny
      select(['id', 'guid', 'email', 'first_name', 'last_name', 'updated_at']\
        .collect {|s| "#{self.table_name}.#{s}"}.join(","))
    end
  end
end
