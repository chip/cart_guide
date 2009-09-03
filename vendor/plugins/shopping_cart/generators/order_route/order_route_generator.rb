class OrderRouteGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.order_route
    end
  end
end 