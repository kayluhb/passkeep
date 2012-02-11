# == Schema Information
#
# Table name: entries
#
#  id                      :integer         not null, primary key
#  guid                    :string(36)
#  title                   :string(255)
#  encrypted_username      :string(255)
#  encrypted_password      :string(255)
#  encrypted_url           :string(255)
#  encrypted_notes         :text
#  expiration              :datetime
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :string(255)
#  attachment_updated_at   :datetime
#  created_at              :datetime        not null
#  updated_at              :datetime        not null
#

require 'spec_helper'

describe Entry do
  pending "add some examples to (or delete) #{__FILE__}"
end
