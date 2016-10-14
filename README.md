# CookieParser

A very basic Cookie string parser. instanciate a Cookie from a cookie string & play with it as object with all its attributes

In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cookie_parser`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cookie_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cookie_parser

## Usage

~~~ruby
require "cookie_parser"

# get the cookie from a randome url
uri = URI.parse 'https://www.instagram.com/p/BLeOiwwhQy-/'
http = Net::HTTP.new uri.host, uri.port
request = Net::HTTP::Get.new uri.request_uri
http.use_ssl = true
resp, data = http.request request
cookie_string = resp.response['Set-Cookie']

# create the CookieParser::Cookie from the cookie_string
@cookie = CookieParser::Cookie.new cookie_string

# now you can read all attributes (include crsf_token)
@cookie.csrftoken
# return something like ptLNsj1igf3jL1WbiANNLf3j1QhaMiYj
~~~

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cookie_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

