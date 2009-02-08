class Post < ActiveRecord::Base

  validates_presence_of :title
  
  has_many :assets
  accepts_nested_attributes_for :assets
  
  stuffing

  def when_published
    return 'today' if created_at.to_date == Date.today
    return 'yesterday' if created_at.to_date == Date.yesterday
    return 'before'
  end
end
