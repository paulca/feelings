# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  layout 'application'

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'ad33d2d66834ece2a8c08377a89025b1'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def redirect_to_old
    redirect_to :host => 'old.pabcas.com'
  end
  
private
  def check_settings
    if not defined?(SETTINGS)
      redirect_to(new_install_url)
    end
  end
end
