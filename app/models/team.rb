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

  # Relations
  has_many :team_members, dependent: :destroy
  has_many :users, -> { order('users.first_name') }, through: :team_members

  has_many :team_projects, dependent: :destroy
  has_many :projects, -> { order('projects.name') }, through: :team_projects

end
