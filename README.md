# GoogleDriveDirectDownload

This gem has a goal to generate direct link from shared google drive link. With direct link you can open the file stored in Google drive and process the content in your code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_drive_direct_download', git: 'https://github.com/italomatos/google_drive_direct_download.git'
```

And then execute:

    $ bundle install

## Usage for Google Direct Download

```ruby
shared_file_url = 'https://drive.google.com/file/d/1rPaKSOqnOyrnwhYctJH1oEZJXRf45Izm/view?usp=sharing'

direct_url = Google::DirectDownload.new(shared_file_url).call
puts direct_url
```

## Usage for Google Docs Download

```ruby
require 'open-uri'
require 'csv'
shared_file_url = 'https://docs.google.com/spreadsheets/d/1AW8dIvzXSWiE1jRiSwfgQHKnt6CmTycf_FRYdNIzIUE/edit?usp=sharing'

direct_url = Google::Docs::DirectDownload.new(shared_file_url, :csv).call
CSV.foreach(open(direct_url).path) do |row|
  puts "#{row[0]}=>#{row[1]}"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/italomatos/google_drive_direct_download.
