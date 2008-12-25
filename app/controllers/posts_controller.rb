class PostsController < ApplicationController
  
  layout 'posts', :except => [:index, :show]
  layout 'application', :only => [:index, :show]
  
  def index
    @posts = Post.by_date
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    @post.date = Time.now
    if @post.save
      redirect_to new_post_path
    end
  end
  
  def edit
    @post = Post.get(params[:id])
  end
  
  def update
    @post = Post.get(params[:id])
    params[:post].each do |k,v|
      @post.send("#{k}=", v)
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
end
