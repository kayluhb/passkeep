# == Schema Information
#
# Table name: entry_imports
#
#  id              :integer         not null, primary key
#  attachment_uid  :string(255)
#  attachment_name :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

require 'spec_helper'

describe EntryImport do
  pending "add some examples to (or delete) #{__FILE__}"
end
