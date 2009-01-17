class FeelingsController < ApplicationController
  
  before_filter :check_settings
  
  def index
    @posts = Post.by_published_and_date
  end
  
end