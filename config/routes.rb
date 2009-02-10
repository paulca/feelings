ActionController::Routing::Routes.draw do |map|
  map.resources :posts, :member => [:publish, :attachment]
  map.resource :install, :controller => 'install'
  map.root :controller => "feelings"
  map.admin '/admin', :controller => 'posts', :action => 'new'
  map.feed '/feed/atom.:format', :controller => 'feelings', :action => 'index'
  map.slug "/feeling/:slug", :controller => 'feelings', :action => 'show', :slug => /.*/
end
