require 'bundler/setup'
require 'coveralls'

require 'app_configuration'

module Helpers

  def fixture_path
    File.expand_path(File.join('.', 'spec', 'fixtures'))
  end

end

Coveralls.wear!
RSpec.configure do |config|

  config.include(Helpers)

end