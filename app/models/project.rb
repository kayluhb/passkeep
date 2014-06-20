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
end
