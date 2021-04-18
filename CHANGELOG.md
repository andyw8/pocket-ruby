## [Unreleased]

## [0.3.0] - 2021-04-18

- Fix Faraday error handling. ([#81](https://github.com/turadg/pocket-ruby/pull/81))
- Don't assume `is_article` is present ([#78](https://github.com/turadg/pocket-ruby/pull/78)).
- Handle article with missing `resolved_url` or `resolved_title` ([#77](https://github.com/turadg/pocket-ruby/pull/77))
- Remove unnecessary use of `method_missing`. ([#71](https://github.com/turadg/pocket-ruby/pull/71))
- Simplify internal structure for `Client` class and modules.

## [0.3.0] - 2021-04-11

- Hand article with missing `excerpt`. ([#63](https://github.com/turadg/pocket-ruby/pull/63))
- Add support for `domain_metadata` in Article response. ([#57](https://github.com/turadg/pocket-ruby/pull/57))
- Add `time_to_read` field to `Pocket::Article`.
- Return nil for `word_count` if not present ([#48](https://github.com/turadg/pocket-ruby/pull/48))

## [0.2.1] - 2021-04-10

- Return nil if `time_read` or `time_favorited` is '0' in the API response. Otherwise, this may be interpreted the Unix epoch (1970-01-01). ([#46](https://github.com/turadg/pocket-ruby/pull/46))

## [0.2.0] - 2021-04-03

- Add support for authors and tags in `Pocket::Article` ([#44](https://github.com/turadg/pocket-ruby/pull/44))

## [0.1.0] - 2021-04-03

- Add `Pocket::Article` for parsing an article response ([#39](https://github.com/turadg/pocket-ruby/pull/39))
- Fix Pocket::Client::Retrieve#retrieve params default ([#21](https://github.com/turadg/pocket-ruby/pull/21))

## [0.0.9] - 2021-04-01

- Actually remove unused Hashie dependency ([#35](https://github.com/turadg/pocket-ruby/pull/35))

## [0.0.8] - 2021-03-31

- Fix Ruby warnings ([#32](https://github.com/turadg/pocket-ruby/pull/32))
- Remove unused Hashie dependency ([#31](https://github.com/turadg/pocket-ruby/pull/31))

## [0.0.7] - 2021-03-29

- Relax `faraday_middleware` version constraint ([#25](https://github.com/turadg/pocket-ruby/pull/25))
