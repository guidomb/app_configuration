# AppConfiguration

[![Build Status](https://travis-ci.org/guidomb/app_configuration.png)](https://travis-ci.org/guidomb/app_configuration)
[![Coverage Status](https://coveralls.io/repos/guidomb/app_configuration/badge.png?branch=master)](https://coveralls.io/r/guidomb/app_configuration)
<a href="/github/guidomb/app_configuration/badges"><img alt="App_configuration" src="https://codeclimate.com/github/guidomb/app_configuration.png" style="position: relative; top: 4px"></a>

**AppConfiguration** is a very simple gem that helps you configure your Ruby applications. **AppConfiguration** uses YAML config files or environmental variales to set
the configuration parameters.

## Installation

Add this line to your application's Gemfile:

    gem 'app_configuration'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app_configuration

## Usage

**AppConfiguration** comes with great default values. So if you want to setup a new config all you need to do is 

```ruby
config = AppConfiguration.new
my_configurable_variable = config.foo
my_other_variable = config['bar']
```

By default, when getting the variable `foo` **AppConfiguration** will look for the environmental variable `FOO`.
If it cannot find it, **AppConfiguration** will look for the `.config.yml` file in the current working directory. 
If there is no config file there, it will try to find the `.config.yml` in your home directory.

A possible `.config.yml` for this example could look like this

```yaml
foo: 'This is the foo variable'
bar: 'This is the bar variable'
```

### Customize your configuration ###

**AppConfiguration** can be customized to fit your needs. Here is an example

```ruby
config = AppConfiguration.new('.setup.yml') do
  base_local_path '/usr/local'
  base_global_path '/config'
  use_env_variables true
  prefix 'my_app'
end
```

You can set the configuration file name by passing the name to the new method or you can use the `config_file_name`
method inside the configuration block.

 * `config_file_name` Sets the name of the config file. Default `.config.yml`.
 * `base_local_path` Sets the base path for the local configuration file. If there is no config file in this path it will
look in the global configuration path. Default `./`
 * `base_global_path` Sets the base path for the global configuration file. Default `~/`
 * `use_env_variables` Flag that activates the use of enviromental variable. Default `true`
 * `prefix` A prefix to be appended when looking for environmental variables. For example if `prefix` is set to `my_app`,
when the `foo` variable is fetched, the `MY_APP_FOO` environmental variable will be checked. 
This is used to avoid name collitions. Default `nil`

### Variable lookup ###

You can retrieve a variable from a `AppConfiguration::Config` object by doing

```ruby
foo = config.foo
foo = config['foo']
```

Environmental variables will be checked first, adding the necesary prefix if provided. If there is no environmental
variable, the local config file will be checked. If there is no local file or a value has not been defined for
the given variable, the global config file will be checked. Otherwise it returns nil.

### Configuration registry ###

If you create a new config object by using `AppConfiguration.new`, then you must keep the reference to this configuration.
Instead you can registers a configuration by using `AppConfiguration.for`. Then you can obtain a configuration by using
`AppConfiguration[]`. For example

```ruby
AppConfiguration.for :github
# ... Then somewhere else ...
github = AppConfiguration[:github]
github.api_key
```

In the previous example the name of the configuration file is assumed to be `.github.yml` and all the environmental variables
will be prefixed with `GITHUB_`. You can change this behaviour by passing a configuration block to the `for` method.

### Default values ###

To change the default local path and the default global path for all the `AppConfiguration::Config` objects all you
need to do is 

```ruby
AppConfiguration::Config.default_local_path = Rails.root
AppConfiguration::Config.default_global_path = '/usr/configs'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Please add specs for all new features. If you find a bug and an spec probing that the bug exists and in a separate commit
add the bug fix.

## License

Copyright (c) 2013 Guido Marucci Blas

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
