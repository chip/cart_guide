require File.dirname(__FILE__) + '/test_helper.rb' 

class RoutingTest < Test::Unit::TestCase 
  def setup 
    ActionController::Routing::Routes.draw do |map| 
      map.products 
    end  
  end  
  
  def test_products_route 
    assert_recognition :get, "/products", :controller => "products_controller", :action => "index"  
  end  

  
private 

  def assert_recognition(method, path, options)  
    result = ActionController::Routing::Routes.recognize_path(path, :method => method)  
    assert_equal options, result 
  end
end 