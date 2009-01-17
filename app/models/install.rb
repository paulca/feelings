require 'ostruct'
class Install < OpenStruct
  
  def new_record?
    true
  end
  
  def database_details
    {'development' => {'database' => development_database}, 'production' => {'database' => production_database}}
  end
  
  def user_details
    {'username' => username, 'password' => password}
  end
  
  def save
    return false unless valid?
    File.open(COUCHDB_FILE, 'w') do |couchdb_file|
      YAML.dump(database_details, couchdb_file)
    end
    File.open(SETTINGS_FILE, 'w') do |settings_file|
      YAML.dump(user_details, settings_file)
    end
  end
  
  def valid?
    validate
  end
  
  def errors
    @errors ||= []
  end
  
  def validate
    self.errors << "Please enter at least the production database" if production_database.blank?
    self.errors << "Please enter a username and password" if username.blank? or password.blank?
    return false unless self.errors.empty?
    return true
  end
end
