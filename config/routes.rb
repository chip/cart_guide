ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'products', :action => 'index'
  map.products
end
