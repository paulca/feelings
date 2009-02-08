class Asset < ActiveRecord::Base
  has_attached_file :file, 
                :styles => { :medium => "300x300>", :thumb => "100x100>"
                :url => "/system/:site_id/:folder/:basename.:extension",
                :path => "/var/www/pitstop/current/public/system/:site_id/:folder/:basename.:extension"
end
