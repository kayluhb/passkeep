Factory.sequence :email do |n|
  "user#{n}@passkeep.com"
end

Factory.define :user do |u|
  u.first_name  'Admin'
  u.last_name   'Istrator'
  u.email       { Factory.next :email }
  u.password    'Passkeep1!'
end
