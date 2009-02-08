class Post < ActiveRecord::Base
  stuffing
  
  has_attached_file :image, 
                :url => "/system/:site_id/:folder/:basename.:extension",
                :path => "/var/www/pitstop/current/public/system/:site_id/:folder/:basename.:extension"

  def when_published
    return 'today' if created_at.to_date == Date.today
    return 'yesterday' if created_at.to_date == Date.yesterday
    return 'before'
  end
end
