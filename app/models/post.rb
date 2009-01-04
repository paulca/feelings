require 'couchrest'
class Post < CouchRest::Model
  
  use_database CouchRest.database!(COUCHDB['database'])
  unique_id :slug

  view_by :date, :descending => true
  view_by :published, :date, :descending => true
  view_by :user_id, :date

  view_by :tags,
    :map => 
      "function(doc) {
        if (doc['couchrest-type'] == 'Post' && doc.tags) {
          doc.tags.forEach(function(tag){
            emit(tag, 1);
          });
        }
      }",
    :reduce => 
      "function(keys, values, rereduce) {
        return sum(values);
      }"  

  key_writer :date, :published
  key_reader :slug, :created_at, :updated_at
  key_accessor :title, :tags, :type, :verb, :content, :link

  timestamps!

  before(:create, :generate_slug_from_title)
  before(:save, :set_published_flag)
  def generate_slug_from_title
    use = title.blank? ? content : title
    self['slug'] = use.downcase[0,100].gsub(/[^a-z0-9]/,'-').squeeze('-').gsub(/^\-|\-$/,'')
  end
  
  def set_published_flag
    self.published = true if published == '1'
  end
  
  def method_missing(method, *args)
    if method.to_s.last == '='
      self[method.to_s[0,method.to_s.length - 1]] = args.first
    else
      self[method.to_s]
    end
  end
end