Factory.sequence :entry_title do |n|
  "Entry #{n}"
end

Factory.define :entry do |u|
  u.name        { Factory.next :entry_title }
  u.project_id  1
end
