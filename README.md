Archivist::Client - an *archive.org* Ruby client
=========

| Project                 |  Archivist::Client    |
|------------------------ | ----------------- |
| gem name                |  archivist-client   |
| license                 |  [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT) |
| version                 |  [![Gem Version](https://badge.fury.io/rb/archivist-client.png)](http://badge.fury.io/rb/archivist-client) |
| dependencies            |  [![Depfu](https://badges.depfu.com/badges/dc329b01f16a110144f5eccb01fb5246/count.svg)](https://depfu.com/github/wordtreefoundation/archivist-client?project=Bundler) |
| code quality            |  [![Code Climate](https://codeclimate.com/github/wordtreefoundation/archivist-client.png)](https://codeclimate.com/github/wordtreefoundation/archivist-client) |
| inline documenation     |  [![Inline docs](http://inch-ci.org/github/wordtreefoundation/archivist-client.png)](http://inch-ci.org/github/wordtreefoundation/archivist-client) |
| continuous integration  |  [![Build Status](https://secure.travis-ci.org/wordtreefoundation/archivist-client.png?branch=master)](https://travis-ci.org/wordtreefoundation/archivist-client) |
| test coverage           |  [![Coverage Status](https://coveralls.io/repos/wordtreefoundation/archivist-client/badge.png)](https://coveralls.io/r/wordtreefoundation/archivist-client) |
| homepage                |  [![GitHub stars](https://img.shields.io/github/stars/wordtreefoundation/archivist-client.svg?style=social&label=Stars)](https://github.com/wordtreefoundation/archivist-client) |
| documentation           |  [http://rdoc.info/github/wordtreefoundation/archivist-client/frames][documentation] |
| authors                 |  Duane [![Tweet Duane](https://img.shields.io/twitter/follow/canadaduane.svg?style=social&label=Follow)](https://twitter.com/canadaduane) |
|                         |  Peter [![Tweet Peter](https://img.shields.io/twitter/follow/galtzo.svg?style=social&label=Follow)](http://twitter.com/galtzo) |


Getting Started
---------------

```ruby
require 'archivist/client'
```

Create an Archivist client:
```ruby
client = Archivist::Client::Base.new
```

Search for the books you're interested in:
```ruby
books = client.search(:start_year => 1500, :end_year => 1510)
```

Download them:
```ruby
books.each do |book|
  puts book.download
end
```

## Contributors

See the [Network View](https://github.com/wordtreefoundation/archivist-client/network) and the [CHANGELOG](https://github.com/wordtreefoundation/archivist-client/blob/master/CHANGELOG.md)

## How you can help!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
6. Create new Pull Request

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver].
Violations of this scheme should be reported as bugs. Specifically,
if a minor or patch version is released that breaks backward
compatibility, a new version should be immediately released that
restores compatibility. Breaking changes to the public API will
only be introduced with new major versions.

As a result of this policy, you can (and should) specify a
dependency on this gem using the [Pessimistic Version Constraint][pvc] with two digits of precision.

For example:

    spec.add_dependency 'archivist-client', '~> 0.1.0'

## References

* [Source Code](http://github.com/wordtreefoundation/archivist-client)
* [Release Announcement](http://www.textual-analysis.org/2013/11/archivist/)
* [The Archivist::Client Blog](http://www.textual-analysis.org/category/archivist/)

## Legal

* MIT License - See LICENSE file in this project
* Copyright (c) 2013 Duane Johnson & Word Tree Foundation

[semver]: http://semver.org/
[pvc]: http://docs.rubygems.org/read/chapter/16#page74
[documentation]: http://rdoc.info/github/wordtreefoundation/archivist-client/frames
[homepage]: https://github.com/wordtreefoundation/archivist-client


