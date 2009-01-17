class PostsController < ApplicationController

  before_filter :check_settings  
  layout 'posts', :except => [:index, :show]
  before_filter :require_password, :except => "show"

  def index
    @posts = Post.by_date
    redirect_to new_post_path
  end
  
  def new
    @post = Post.new
    @unpublished_posts = Post.by_not_published
    @published_posts = Post.by_published_and_date
  end
  
  def create
    @unpublished_posts = Post.by_not_published
    @published_posts = Post.by_published_and_date
    @post = Post.new(params[:post])
    @post.date = Time.now
    if params['attachment']
      attachment = params["attachment"]
      @post["_attachments"] ||= {}
      filename = File.basename(attachment.original_filename)
      @post["_attachments"][filename] = {
        "content_type" => attachment.content_type,
        "data" => attachment.read
      }
    end
    if params['save-publish']
      @post.published = true
    end
    if @post.save
      redirect_to new_post_path
    end
  end
  
  def show
    @posts = [Post.get(params[:id])]
    render :layout => 'application', :template => 'feelings/index'
  end
  
  def publish
    @post = Post.get(params[:id])
    @post.published = true
    @post.save
    redirect_to new_post_path
  end
  
  def edit
    @post = Post.get(params[:id])
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
    if params['attachment']
      attachment = params["attachment"]
      @post["_attachments"] ||= {}
      filename = File.basename(attachment.original_filename)
      @post["_attachments"][filename] = {
        "content_type" => attachment.content_type,
        "data" => attachment.read
      }
    end
    if params['save-publish']
      @post.published = true
    end
    if @post.save
      redirect_to posts_path
    end
  end
  
  def destroy
    @post = Post.get(params[:id])
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
