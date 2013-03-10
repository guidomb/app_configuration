require "app_configuration/version"
require "app_configuration/optional_attr"
require "app_configuration/config_registry"
require "app_configuration/config"

module AppConfiguration
  extend ConfigRegistry

  def self.new(config_file_name, &block)
    Config.new(config_file_name, &block)
  end

end