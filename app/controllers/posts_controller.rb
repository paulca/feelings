class PostsController < ApplicationController

  before_filter :check_settings  
  layout 'posts', :except => [:index, :show]
  before_filter :require_password, :except => "show"

  def index
    @posts = Post.all
    redirect_to new_post_path
  end
  
  def new
    @post = Post.new
    @unpublished_posts = Post.all(:conditions => {:published => false})
    @published_posts = Post.all(:conditions => {:published => true})
  end
  
  def create
    @unpublished_posts = Post.all(:conditions => {:published => false})
    @published_posts = Post.all(:conditions => {:published => true})
    @post = Post.new(params[:post])
    if params['save-publish']
      @post.published = true
    end
    if @post.save
      redirect_to new_post_path
    end
  end
  
  def show
    @posts = [Post.find(params[:id])]
    render :layout => 'application', :template => 'feelings/index'
  end
  
  def publish
    @post = Post.find(params[:id])
    @post.published = true
    @post.save
    redirect_to new_post_path
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def attachment
    @post = Post.get(params[:id])
    send_data RestClient.get('http://localhost:5984/' + COUCHDB['database'] + '/' + @post.id + '/' + @post._attachments.keys.first)
  end
  
  def update
    @post = Post.get(params[:id])
    params[:post].each do |k,v|
      @post.send("#{k}=", v)
    end
    if params['save-publish']
      @post.published = true
    end
    if @post.save
      redirect_to posts_path
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
protected
  def require_password
    authenticate_or_request_with_http_basic do |username, password|
      username == SETTINGS['username'] && password == SETTINGS['password']
    end
  end

end
