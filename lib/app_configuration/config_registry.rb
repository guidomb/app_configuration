module AppConfiguration

  module ConfigRegistry
   
    def for(config, &block)
      @configs[config] = new(".#{config}.yml", &block)
    end

    def [](config)
      @configs[config]
    end

    def self.extended(object)
      object.instance_variable_set("@configs", {})
    end

  end

end