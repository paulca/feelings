class FeelingsController < ApplicationController
  
  before_filter :check_settings
  
  def index
    @posts = Post.all
  end
  
end