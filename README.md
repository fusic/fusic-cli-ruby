# Fusic CLI

For those who love Fusic, this is a CLI for quick access to Fusic information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fusic-cli-ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install fusic-cli-ruby

## Usage

ex: Go to the Top page.

```sh
$ fusic top
https://fusic.co.jp/ # and open top page in your browser.
```

You can use the following command to open the page you want instantly.

```sh
$ fusic blog            # Open blog top page.
$ fusic help [COMMAND]  # Describe available commands or one specific command
$ fusic members         # Open members page.
$ fusic news            # Open news top page.
$ fusic outline         # Open company/outline page.
$ fusic techblog        # Open techblog top page.
$ fusic top             # Open top page.
$ fusic version         # version
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fusic-cli-ruby.

