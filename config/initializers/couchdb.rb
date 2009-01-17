COUCHDB_FILE = RAILS_ROOT + '/config/couchdb.yml'
if(File.exist?(COUCHDB_FILE))
  COUCHDB = YAML.load_file(RAILS_ROOT + '/config/couchdb.yml')[ENV['RAILS_ENV']]
end