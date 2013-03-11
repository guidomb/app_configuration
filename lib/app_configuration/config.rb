require 'yaml'

module AppConfiguration

  class Config
    include OptionalAttr

    optional_attr :config_file_name,  default: '.config.yml'
    optional_attr :base_local_path,   default: './'
    optional_attr :base_global_path,  default: '~/'
    optional_attr :use_env_variables, default: true
    optional_attr :prefix            

    # Class Methods

    class << self

      def default_local_path=(default_local_path)
        defaults[:base_local_path] = default_local_path
      end

      def default_global_path=(default_global_path)
        defaults[:base_global_path] = default_global_path
      end

    end

    # Instance Methods

    def initialize(config_file_name, &block)
      super() # Sets default values for optional attributes
      @config_file_name = config_file_name
      self.instance_eval(&block) if block_given?
    end

    def local_config_path 
      @local_config_path ||= config_path(@base_local_path)
    end

    def global_config_path 
      @global_config_path ||= config_path(@base_global_path)
    end

    def [](name)
      env_name = ''
      env_name << "#{@prefix.upcase}_" if @prefix
      env_name << name.to_s.upcase
      if @use_env_variables && ENV[env_name]
        ENV[env_name]
      else
        config[name]
      end
    end

    def method_missing(method, *args, &block)
      self[method]
    end

    private

      def config
        return @config if @config

        @config = {}
        @config.merge!(YAML.load_file(global_config_path)) if File.exist?(global_config_path)
        @config.merge!(YAML.load_file(local_config_path)) if File.exist?(local_config_path)
        @config
      end

      def config_path(base_path)
        File.expand_path(File.join(base_path, @config_file_name))
      end
  end

end