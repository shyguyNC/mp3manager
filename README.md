# mp3manager

mp3manager is a small (and currently very rough) gem for mp3 management, based on id3 tags.
It arose from a need to easily organize my mp3s for playing DJ gigs from a flash drive.
As you'll see from the usage, this gem doesn't do much right now.
It simply saves all mp3s from a source folder as '[artist] - [title].mp3' into the destination folder. Any pre-existing files or directories in the destination folder will be deleted.
I intend to expand functionality to handle other audio files beyond mp3, and allow customized file name formatting and directory creation. Eventually, this gem will be released to RubyForge and/or GemCutter.

This project is my first foray into Ruby develpoment, so please don't pull any punches! Feel free to tear the code apart, I welcome all suggestions on improving efficiency and adhering to best practices in Ruby.

Be sure to read through the issues section before submitting new issues/feature requests.

## Installation

Download all source files and run:

rake install

mp3manager requires moumar's mp3info gem
https://github.com/moumar/ruby-mp3info

gem install mp3info

## Usage

From your ruby script:

require "mp3manager"

Mp3manager.clone("source-folder", "destination-folder")

OR from the command line:

mp3manager source-folder destination-folder

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request