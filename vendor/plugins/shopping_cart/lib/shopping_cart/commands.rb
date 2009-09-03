require 'rails_generator'
require 'rails_generator/commands'

module ShoppingCart #:nodoc:
  module Generator #:nodoc:
    module Commands #:nodoc:
      module Create
        def order_route
          logger.route "map.order"
          look_for = 'ActionController::Routing::Routes.draw do |map|'
          unless options[:pretend]
            gsub_file('config/routes.rb', /(#{Regexp.escape(look_for)})/mi){|match| "#{match}\n  map.orders\n"}
          end
        end
      end  
      
      module Destroy
        def order_route
          logger.route "map.order"
          gsub_file 'config/routes.rb', /\n.+?map\.orders/mi, ''
        end
      end  
      
      module List
        def order_route
        end
      end
      
      module Update
        def order_route
        end
      end
    end
  end 
end
Rails::Generator::Commands::Create.send   :include, ShoppingCart::Generator::Commands::Create
Rails::Generator::Commands::Destroy.send  :include, ShoppingCart::Generator::Commands::Destroy
Rails::Generator::Commands::List.send     :include, ShoppingCart::Generator::Commands::List
Rails::Generator::Commands::Update.send   :include, ShoppingCart::Generator::Commands::Update 