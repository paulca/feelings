class Post < ActiveRecord::Base
  stuffing
  
  def when_published
    return 'today' if created_at.to_date == Date.today
    return 'yesterday' if created_at.to_date == Date.yesterday
    return 'before'
  end
end
