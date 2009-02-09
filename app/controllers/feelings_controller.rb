class FeelingsController < ApplicationController
  
  before_filter :check_settings
  
  def index
    @posts = Post.all(:conditions => {:published => true}, :order => 'created_at DESC')
    respond_to do |format|
      format.html
      format.xml { render :layout => false }
    end
  end
  
  def show
    @posts = [Post.find_by_slug(params[:slug])]
    render :action => 'index'
  end
  
end