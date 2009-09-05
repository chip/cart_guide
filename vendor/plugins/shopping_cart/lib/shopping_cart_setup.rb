require 'fileutils'
 
module ShoppingCart #:nodoc
  module SetupTasks #:nodoc
 
    def self.do_setup 
      begin
        puts "STEP 1 -- Generate ShoppingCart migration file"
        generate_migration
        write_migration_content
        puts "STEP 2 -- ShoppingCart plugin view files"
        copy_view_files
        puts "Followup Steps"
        puts "STEP 3 -- run the task 'rake db:migrate'"
        puts "STEP 4 -- edit the file config/routes.rb"
        puts <<-END_ROUTES
          map.root :controller => 'products', :action => 'index'
          map.resources :products
          map.current_cart 'cart', :controller => 'carts', :action => 'show', :id => 'current'
          map.resources :carts
          map.resources :orders
        END_ROUTES
        puts "STEP 5 (optional) -- run the task 'rake shopping_cart:products'"
      rescue StandardError => e
        p e
      end
    end
 
    private
 
    def self.generate_migration
      puts "==============================================================================="
      puts "ruby script/generate migration create_shopping_cart_tables"
      puts %x{ruby script/generate migration create_shopping_cart_tables}
      puts "================================DONE==========================================="
    end
  
    def self.migration_source_file
      File.join(File.dirname(__FILE__), "../assets", "migration", "create_shopping_cart_tables.rb")
    end
 
    def self.write_migration_content
      copy_to_path = File.join(RAILS_ROOT, "db", "migrate")
      migration_filename =
        Dir.entries(copy_to_path).collect do |file|
          number, *name = file.split("_")
          file if name.join("_") == "create_shopping_cart_tables.rb"
        end.compact.first
      migration_file = File.join(copy_to_path, migration_filename)
      File.open(migration_file, "wb"){|f| f.write(File.read(migration_source_file))}
    end
 
    def self.copy_view_files
      mkdir(File.join(RAILS_ROOT, "app/views/shopping_cart")) unless File.exist?(File.join(RAILS_ROOT, "app/views/shopping_cart"))
      view_files = File.join(File.dirname(__FILE__), "../assets", "views")
      Dir.entries(view_files).collect do |file|
        source_file = File.join(File.dirname(__FILE__), "../assets", "views", file)
        destination_file = File.join(RAILS_ROOT, "app/views/shopping_cart/", File.basename(file))
        next if source_file =~ /\.$/ 
        puts "Copying #{source_file} to #{destination_file}"
        FileUtils.cp(source_file, destination_file)
      end
      puts "================================DONE==========================================="
    end
  end
end