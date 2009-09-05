ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'products', :action => 'index'
  map.resources :products
  map.current_cart 'cart', :controller => 'carts', :action => 'show', :id => 'current'
  map.resources :carts
  map.resources :line_items
  map.resources :orders
end
