# Contracts::NonIntrusive

Less intrusive version of Contracts DSL. Allows to use static/dynamic code
analysis tools.

*NOTE: This is in a proof-of-concept state and doesn't have tests (read:
quick hack to see if it is possible at all)*

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'contracts-non_intrusive'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install contracts-non_intrusive

## Usage

First, you should have some version of `contracts.ruby` installed.

```ruby
require "contracts/non_intrusive"
C = Contracts

class Example
  include Contracts::NonIntrusive

  Contract(C::Num, C::Num => C::Num)[:add => :add__raw]
  def add__raw(a, b)
    a + b
  end
end
```

### Singleton methods

This gem does not support (Yet?) singleton methods, workaround is to use
singleton class:

```ruby
class Example
  class << self
    include Contracts::NonIntrusive

    Contract(C::Num, C::Num => C::Num)[:add => :add__raw]
    def add__raw(a, b)
      a + b
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/waterlink/contracts-non_intrusive/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
