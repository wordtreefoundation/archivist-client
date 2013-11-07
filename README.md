Archivist
=========

an *archive.org* Ruby client

Getting Started
---------------

```ruby
require 'archivist'
```

Create an Archivist client:
```ruby
client = Archivist::Client.new
```

Search for the books you're interested in:
```ruby
books = client.search(:start_year => 1500, :end_year => 1510)
```

Download them:
```ruby
books.each do |d|
  puts d.download
end
```