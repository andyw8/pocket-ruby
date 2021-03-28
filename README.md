pocket-ruby
===========

Ruby API for v3 of the [Pocket API](http://getpocket.com/developer/docs/overview) (formerly Read It Later)

This is a fork of turadg/pocket since it hadn't been updated since 2015.

# Usage

Just clone the repo here and refer to the demo-server.rb file for examples on how to interact with the Pocket API.

```sh
	git clone
	cd pocket-ruby-andyw8
	bundle install
	ruby demo-server.rb
```

Pocket-Ruby can be installed via the gem, ```gem install pocket-ruby-andyw8```

Or via bundler, ```gem 'pocket-ruby-andyw8'```

# For v0.0.5 and earlier

Using v0.0.5 and earlier may result in a ```require``` error. To fix this you may either update to a newer version of the gem or uninstall with ```gem uninstall pocket-ruby``` and try again using the method below:

Install via the gem, ```gem install pocket-ruby -v 0.0.5```

Or via bundler, ```gem 'pocket-ruby', '0.0.5', :require => 'pocket'```

Be sure to require the gem in your code with ```require 'pocket'``` not ```require 'pocket-ruby'```
