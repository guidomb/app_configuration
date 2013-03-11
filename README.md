# AppConfiguration

[![Build Status](https://travis-ci.org/guidomb/app_configuration.png)](https://travis-ci.org/guidomb/app_configuration)
[![Coverage Status](https://coveralls.io/repos/guidomb/app_configuration/badge.png?branch=master)](https://coveralls.io/r/guidomb/app_configuration)
<a href="/github/guidomb/app_configuration/badges"><img alt="App_configuration" src="https://codeclimate.com/github/guidomb/app_configuration.png" style="position: relative; top: 4px"></a>

**AppConfiguration** is a very simple gem that helps you configure your Ruby applications. It was extracted from a Rails project
but it also can be used in non Rails projects. **AppConfiguration** uses YAML config files or environmental variales to set
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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

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
