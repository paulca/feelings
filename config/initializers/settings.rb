SETTINGS_FILE = RAILS_ROOT + '/config/settings.yml'
if(File.exist?(SETTINGS_FILE))
  SETTINGS = YAML.load_file(RAILS_ROOT + '/config/settings.yml')
end