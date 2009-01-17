ActionController::Routing::Routes.draw do |map|
  map.resources :posts, :member => [:publish, :attachment]
  map.resource :install, :controller => 'install'
  map.root :controller => "feelings"
  map.admin '/admin', :controller => 'posts', :action => 'new'
end
