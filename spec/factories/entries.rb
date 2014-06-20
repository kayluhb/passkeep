# == Schema Information
#
# Table name: entries
#
#  id                 :integer          not null, primary key
#  guid               :string(36)       not null
#  title              :string(255)      not null
#  search_text        :string(255)
#  encrypted_username :string(255)
#  encrypted_password :string(255)
#  encrypted_url      :string(255)
#  encrypted_notes    :text
#  attachment_uid     :string(255)
#  attachment_name    :string(255)
#  expiration         :datetime
#  project_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    guid "MyString"
    title "MyString"
    search_text "MyString"
    encrypted_username "MyString"
    encrypted_password "MyString"
    encrypted_url "MyString"
    encrypted_notes "MyString"
    attachment_uid "MyString"
    attachment_name "MyString"
    expiration "2014-06-20 11:19:52"
    project nil
  end
end
