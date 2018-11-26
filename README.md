# ConnectorKit 🔌

[![Gem Version](https://badge.fury.io/rb/connector_kit.svg)](https://badge.fury.io/rb/connector_kit)

A simple Ruby gem for communicating with the [App Store Connect API](https://developer.apple.com/app-store-connect/api). Currently supported features:

 - [x] List users
 - [x] List apps
 - [x] List builds of an app
 - [x] Get build details for a specific build

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'connector_kit'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install connector_kit
```

## Usage

Before you can use this gem you need to set up a new key in the App Store Connect "Users and Access" section. More detailed info here: [App Store Connect API documentation](https://developer.apple.com/documentation/appstoreconnectapi)

First, require the gem and set up a client. The `Client` class has three constructor arguments:

 - `issuer_id`: The Issuer ID of your organisation (you can find this in App Store Connect)
 - `key_id`: The Key ID of the App Store Connect API key you want to use
 - `private_key_file_path`: The path to the `*.p8` file that you downloaded as part of creating an App Store Connect API key

```ruby
require 'connector_kit'

client = ConnectorKit::Client.new(
  '8e2f3845-63ec-4865-8be7-f7cbb3c099db',
  'E28E8EE0B4CE',
  'AuthKey_E28E8EE0B4CE.p8'
)
```

After initialising the client, it will generate a JWT token as described in the documentation for the App Store Connect API. It's valid for 20 minutes. Now you can use it to fetch information from the API:

```ruby
# Fetches all apps in the organisation
apps = client.apps
```

```ruby
# Fetches all builds for an app
builds = client.app_builds(app)
```

```ruby
# Fetches build details for a build
build_details = client.build_beta_details(build)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/simba909/connector_kit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
