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

require 'rails_helper'

RSpec.describe Team, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
