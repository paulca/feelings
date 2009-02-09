class FeelingsController < ApplicationController
  
  before_filter :check_settings
  
  def index
    @posts = Post.all(:order => 'created_at DESC')
    respond_to do |format|
      format.html
      format.xml { render :layout => false }
    end
  end
  
end