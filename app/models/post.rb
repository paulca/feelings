class Post < ActiveRecord::Base
  
  has_many :assets
  accepts_nested_attributes_for :assets
  
  before_create :generate_slug_from_title
  
  stuffing

  def when_published
    return 'today' if created_at.to_date == Date.today
    return 'yesterday' if created_at.to_date == Date.yesterday
    return 'before'
  end
  
  def generate_slug_from_title
    use = title.blank? ? content : title
    self.slug ||= use.downcase[0,100].gsub(/[^a-z0-9]/,'-').squeeze('-').gsub(/^\-|\-$/,'')
  end
end