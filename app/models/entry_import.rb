# == Schema Information
#
# Table name: entry_imports
#
#  id              :integer         not null, primary key
#  team_id         :integer
#  attachment_uid  :string(255)
#  attachment_name :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

require 'csv'

class EntryImport < ActiveRecord::Base

  image_accessor :attachment

  # Setup accessible (or protected) attributes for your model
  attr_accessible :attachment, :retained_attachment, :team_id

  belongs_to :team

  validates :attachment_name, :presence => true
  validates :team, :presence => true

  def process_import
    puts "PROCESS IMPORT #{attachment.path}"
    open(self.attachment.path) do |f|
      f.each_line do |line|
        CSV.parse(line) do |row|
          begin
            ret = self.process_row(row)
          rescue
            puts "can't process this one #{row[0]}"
          end
        end
      end
    end
    self.destroy
  end

  def process_row(row)
    puts "PROCESS ROW"
    project = Project.find_by_name(row[0].strip)
    if project.nil?
      project = Project.new({ :name => row[0].strip })
      project.save
      team.projects << project
      team.save
    end

    h = {
      :title => row[1],
      :username => row[2],
      :password => row[3],
      :url => row[4],
    }
    puts h.to_yaml
    entry = Entry.new(h)
    entry.project = project
    entry.save
  end
end
