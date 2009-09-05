namespace :shopping_cart do
  # require 'rubygems'
  # require 'find'
  # require 'ftools'
  
  desc "Shopping Cart - Populate Products for application"
  task :products => :environment do
    Product.create!({:name => "HOD T",   :description => "Head of Doom Logo T-shirt with long sleeves",  :price => "19.99"})   
    Product.create!({:name => "HOD LS",  :description => "Head of Doom Logo shirt with long sleeves",    :price => "29.99"})   
    Product.create!({:name => "HOD Mug", :description => "Head of Doom Logo Coffee Mug",                 :price => "9.99"})   
  end
  
  # desc "Shopping Cart - Create /app/views/shopping_cart directory"
  # task :create_views_directory do
  #   mkdir_p 'app/views/shopping_cart'
  # end
  # 
  # desc "Shopping Cart - Copy views to application"
  # task :copy_views => [:create_views_directory] do
  #   Find.find('vendor/plugins/shopping_cart/lib/app/views/shopping_cart/') do |original_file|
  #     next unless original_file =~ /\.haml$/
  #     destination_file = "app/views/shopping_cart/" + File.basename(original_file)
  #     puts "Copying #{original_file} to #{destination_file}"
  #     File.copy original_file, destination_file
  #   end
  # end
  desc "Shopping Cart - Setup"
  task :setup => :environment do
    ShoppingCart::SetupTasks.do_setup
  end
end