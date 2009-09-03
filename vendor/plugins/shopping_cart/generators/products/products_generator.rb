class ProductsGenerator < Rails::Generator::NamedBase #Rails::Generator::Base 
  def manifest 
    record do |m| 
      m.file "products.yaml", "products.yaml"
    end
  end
end 