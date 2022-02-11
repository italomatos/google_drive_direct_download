# GoogleDriveDirectDownload

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/google_drive_direct_download`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_drive_direct_download'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install google_drive_direct_download

## Usage for Google Drive Files

```ruby
shared_file_url = 'https://drive.google.com/file/d/1rPaKSOqnOyrnwhYctJH1oEZJXRf45Izm/view?usp=sharing'

direct_url = GoogleDrive::Drive::DirectDownload.new(shared_file_url).call
puts direct_url
```

## Usage for Google Document Files

```ruby
shared_file_url = 'https://docs.google.com/document/d/1GhXACQhr8l5xlZWTW2nJJdXzqmUypiaJHkMpzkt9i4U/edit?usp=sharing'

direct_url = GoogleDrive::Docs::DirectDownload.new(shared_file_url).call
puts direct_url
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/italomatos/google_drive_direct_download.
