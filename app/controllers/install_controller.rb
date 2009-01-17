class InstallController < ApplicationController
  
  before_filter :check_constants
  before_filter :check_install, :except => 'show'
  
  def show
    
  end
  
  def new
    @install = Install.new(:development_database => 'feelings_development', :production_database => 'feelings_production', :username => 'admin')
  end
  
  def create
    @install = Install.new(params[:install])
    if @install.save
      redirect_to install_url
    else
      render :action => 'new'
    end
  end
  
private
  
  def check_constants
    if defined?(SETTINGS) and defined?(COUCHDB)
      redirect_to(posts_url)
    end
  end
  
  def check_install
    if File.exist?(COUCHDB_FILE) and File.exist?(SETTINGS_FILE)
      redirect_to install_url
    end
  end
  
end