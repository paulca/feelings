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
    post = @posts.first
    @page_title = post.title.blank? ? "I #{post.stuffing_verb} this" : post.title
    render :action => 'index'
  end
  
end