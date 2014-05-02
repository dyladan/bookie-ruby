[![Build Status](https://travis-ci.org/dyladan/bookie-ruby.svg?branch=master)](https://travis-ci.org/dyladan/bookie-ruby)

# Bookie

Rubygem to interface with any [Bookie](https://github.com/bookieio/bookie) server.

## Installation

Add this line to your application's Gemfile:

    git clone https://github.com/dyladan/bookie-ruby.git
    cd bookie-ruby
    rake install

## Usage

So far the only really working thing is get by user

    import 'bookie'

    client = Bookie::Client.new ".bookierc"
    bmarks = client.get_by_user("dyladan", 5, 2)

`bmarks` is now an array of type Bookie::Bmark which exports the following
instance attributes: 

## Contributing

1. Fork it [here](http://github.com/dyladan/bookie-ruby/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
