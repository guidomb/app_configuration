# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'app_configuration/version'

Gem::Specification.new do |gem|
  gem.name          = "app_configuration"
  gem.version       = AppConfiguration::VERSION
  gem.authors       = ["Guido Marucci Blas"]
  gem.email         = ["guidomb@gmail.com"]
  gem.description   = %q{A gem to handle ruby application configurations using both YAML config files or environmental variables}
  gem.summary       = %q{A gem to handle ruby application configurations}
  gem.homepage      = "http://github.com/guidomb/app_configuration"

  gem.add_development_dependency "rspec", "2.13.0"
  gem.add_development_dependency "rake", "10.0.3"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
