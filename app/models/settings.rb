class Settings < Settingslogic
  source "#{Rails.root}/config/passkeep.yml"
  namespace Rails.env
end