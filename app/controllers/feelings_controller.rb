class FeelingsController < ApplicationController
  
  before_filter :check_settings
  
  def index
    @posts = Post.all(:order => 'created_at DESC')
  end
  
end