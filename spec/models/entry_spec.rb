# == Schema Information
#
# Table name: entries
#
#  id                 :integer         not null, primary key
#  project_id         :integer
#  guid               :string(36)
#  title              :string(255)     not null
#  encrypted_username :string(255)
#  encrypted_password :string(255)
#  encrypted_url      :string(255)
#  encrypted_notes    :text
#  expiration         :datetime
#  attachment_uid     :string(255)
#  attachment_name    :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

require 'spec_helper'

describe Entry do
  pending "add some examples to (or delete) #{__FILE__}"
end
