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

require 'spec_helper'

describe Team do
  pending "add some examples to (or delete) #{__FILE__}"
end
