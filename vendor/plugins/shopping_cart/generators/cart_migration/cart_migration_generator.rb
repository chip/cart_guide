class CartMigrationGenerator < Rails::Generator::NamedBase
  attr_accessor :migration_name, :migration_action

  def manifest
    @migration_name = "Create#{class_name}"
    @migration_action = "add"
    record do |m|
      m.migration_template 'cart_migration.rb', "db/migrate", { :assigns => cart_local_assigns, :migration_file_name => "create_#{custom_file_name}"  }
    end
  end  
  

private 
  
  def custom_file_name
    custom_name = class_name.underscore.downcase
    custom_name = custom_name.pluralize if ActiveRecord::Base.pluralize_table_names
    custom_name
  end
  
  def cart_local_assigns
    returning(assigns = {}) do
      assigns[:migration_action] = "add"
      assigns[:class_name] = "create_#{custom_file_name}"
      assigns[:table_name] = custom_file_name
      assigns[:attributes] = [Rails::Generator::GeneratedAttribute.new("purchased_at", "datetime")]
    end
  end
  
end 