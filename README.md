# MediumApi

A ruby api wrapper for medium.com

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'medium_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install medium_api

## Usage

First, you need api key. To do this email yourfriends@medium.com. For more info checkout [official docs](https://github.com/Medium/medium-api-docs#22-self-issued-access-tokens)

### Configure the gem
```ruby
MediumApi.configure do |config|
  config.api_key = ''
end
```

### Get current user
```ruby
MediumApi.me
```

### Create a post for current user
```ruby
MediumApi.me.create_post(post_attributes)
```


### Get publications for current user
```
MediumApi.me.publications
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thesmartnik/medium_api_udemy

