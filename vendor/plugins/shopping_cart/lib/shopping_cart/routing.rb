module ShoppingCart #:nodoc:  
  module Routing #:nodoc:  
    module MapperExtensions 
      def products 
        @set.add_route("/products", {:controller => "products_controller", :action => "index"})  
      end  
    end
  end 
end 
ActionController::Routing::RouteSet::Mapper.send :include, ShoppingCart::Routing::MapperExtensions 