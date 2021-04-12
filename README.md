pocket-ruby
===========

[![Code Climate](https://codeclimate.com/github/turadg/pocket-ruby.png)](https://codeclimate.com/github/turadg/pocket-ruby) [![Gem Version](https://badge.fury.io/rb/pocket-ruby.png)](http://badge.fury.io/rb/pocket-ruby)

Ruby API for v3 of the [Pocket API](http://getpocket.com/developer/docs/overview) (formerly Read It Later)

# Usage

Just clone the repo here and refer to the demo-server.rb file for examples on how to interact with the Pocket API.

```sh
	git clone
	cd pocket-ruby
	bundle install
	ruby demo-server.rb
```

*Note:* Changes to the `demo-server.rb` will require a restart to take effect (or you can use [rerun](https://github.com/alexch/rerun)).

Pocket-Ruby can be installed via the gem, ```gem install pocket-ruby```

Or via bundler, ```gem 'pocket-ruby'```

## Pocket API Notes

Below are some aspects of the Pocket API that aren't covered in the official documentation, or that have been observed:

* For very long articles, the maximum reported `word_count` is 65535, even if the article is longer.
* If a `count` isn't specified, the `Retreive` call will return maximum of 5000 items.
* The API response may contain a number of undocumented fields, including:
  * `domain_metadata`
  * `amp_url`
  * `listen_duration_estimate`
  * `time_to_read`
  * `sort_id`
  * `lang` [ISO_639-1](https://en.wikipedia.org/wiki/ISO_639-1)?
* Every integer value is returned as a string, *except* for `time_to_read`, `listen_duration_estimate` and `sort_id`.
* The `time_to_read` is in minutes, but `listen_duration_estimate` is in seconds.
