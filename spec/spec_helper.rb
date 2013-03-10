require 'bundler/setup'

require 'app_configuration'

module Helpers

  def fixture_path
    File.expand_path(File.join('.', 'spec', 'fixtures'))
  end

end

RSpec.configure do |config|

  config.include(Helpers)

end