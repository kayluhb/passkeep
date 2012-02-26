# == Schema Information
#
# Table name: team_members
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  team_id    :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe TeamMember do
  pending "add some examples to (or delete) #{__FILE__}"
end
