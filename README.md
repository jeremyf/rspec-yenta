# RSpec::Yenta



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
