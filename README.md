# RSpec::Yenta

Yenta, find me all of my RSpec matchers.

## Installation

Add this line to your project's Gemfile:

    gem 'rspec-yenta'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-yenta

## Usage

In your project's Rakefile add the following:

```rake
require 'rspec/yenta'
RSpec::Yenta.load_tasks
```

```sh
$ rake yenta
```

If you aren't seeing some of the tasks you were expecting, try the following:

```rake
require 'rspec/yenta'
RSpec::Yenta.load_tasks do
  require File.expand_path("../config/environment.rb",  __FILE__)
end
```

`RSpec::Yenta.load_tasks` takes an arbitrary block. And the above block is
requiring the Rails application. This may also be required if you have custom
matchers that you want to expose. Or if you are working with a Rails Engine.

## Sample Output

```sh
be                          ./path/to/rspec-expectations-2.14.4/lib/rspec/matchers.rb:221
be_a                        ./path/to/rspec-expectations-2.14.4/lib/rspec/matchers.rb:227
be_a_kind_of                ./path/to/rspec-expectations-2.14.4/lib/rspec/matchers.rb:253
be_a_new                    ./path/to/rspec-rails-2.14.0/lib/rspec/rails/matchers/be_a_new.rb:73
be_an                       ./path/to/rspec-expectations-2.14.4/lib/rspec/matchers.rb:227
be_an_instance_of           ./path/to/rspec-expectations-2.14.4/lib/rspec/matchers.rb:240
be_close                    ./path/to/rspec-expectations-2.14.4/lib/rspec/matchers/be_close.rb:4
be_equivalent_to            ./path/to/rspec-expectations-2.14.4/lib/rspec/matchers/dsl.rb:8
```
