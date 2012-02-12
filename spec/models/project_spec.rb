# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  guid       :string(36)
#  name       :string(255)     not null
#  status     :integer         default(1)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Project do
  pending "add some examples to (or delete) #{__FILE__}"
end
