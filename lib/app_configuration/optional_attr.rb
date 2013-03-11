module AppConfiguration

  module OptionalAttr
  
    module ClassMethods
      
      def defaults
        @defaults ||= {}
      end
      protected :defaults

      def optional_attr(attribute, options = {})
        define_method(attribute) do |value| 
          instance_variable_set("@#{attribute}", value) 
        end

        defaults[attribute] = options[:default] if options[:default]
      end 
      protected :optional_attr
    
    end
    
    module InstanceMethods
      
      def initialize
        self.class.send(:defaults).each do |attribute, value|
          instance_variable_set("@#{attribute}", value)
        end
      end

    end
    
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end

  end

end

