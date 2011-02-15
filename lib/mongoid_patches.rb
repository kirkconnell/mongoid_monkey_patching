module Mongoid
  module Patches
    module HandleNestedAttributes
    
      def self.included(klass)
        klass.class_eval do
          def self.handle_nested_attributes_for(*args)
            args.each do |name|
              Mongoid::Patches::HandleNestedAttributes.create_handle_attribute_for name
            end
          end
        end
      end
    
      def self.create_handle_attribute_for(name)
        define_method("handle_#{name}_attributes") do |collection_attrs|
          previous_collection = Array.new(self.send(name))
          begin
            self.send(name).clear
            collection_attrs.each do |_, attrs|
              self.send(name) << Policy.new(attrs) unless all_blank?(attrs) || attrs["_destroy"]
            end
            collection_attrs.clear
            true
          rescue
           self.send("#{name}=", previous_collection)
           false
          end
        end
      end

      def all_blank?(attrs)
        attrs.all? { |key, value| key == "id" || key == "_destroy" ? true : value.blank? }
      end
    end
  end
end