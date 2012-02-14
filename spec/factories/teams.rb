Factory.sequence :team_name do |n|
  "Team #{n}"
end

Factory.define :team do |u|
  u.name          { Factory.next :team_name }
  u.user_ids      []
  u.project_ids   []
end
