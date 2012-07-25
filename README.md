# mp3manager

mp3manager is a small (and currently very rough) gem for mp3 management, based on id3 tags.
It arose from a need to easily organize my mp3s for playing DJ gigs from a flash drive.
As you'll see from the usage, this gem doesn't do much right now.
It simply saves all mp3s from a source folder by id3 tags into the destination folder. The format must be specified by the user (see Formatting below). Any pre-existing files or directories in the destination folder will be deleted.
I intend to expand functionality to handle other audio files beyond mp3, and allow directory creation by including "/" in the format string. Eventually, this gem will be released to RubyForge and/or GemCutter.

This project is my first foray into Ruby develpoment, so please don't pull any punches! Feel free to tear the code apart, I welcome all suggestions on improving efficiency and adhering to best practices in Ruby.

Be sure to read through the issues section before submitting new issues/feature requests.

## Installation

Download all source files and run:

	rake install

mp3manager is written in ruby 1.9.3, installed via rvm
https://rvm.io//

mp3manager requires moumar's mp3info gem
https://github.com/moumar/ruby-mp3info

	gem install mp3info

## Usage

From your ruby script:

	require "mp3manager"
	Mp3manager.clone("format", source-folder", "destination-folder")

OR from the command line:

	mp3manager format source-folder destination-folder

## Formatting

mp3manager requires that the user specify the formatting by which the destination file names should be determined. When creating the format string, places where the mp3's id3 tags should be inserted are specified between square brackets, i.e. [tag]. For example, if the mp3 being renamed is tagged with artist "Zamfir" and title "I Pan't Fight this Feeling Anymore", then regardless of the actual source filename, setting format to:

	[artist] - [title]

will yield a file named:

	Zamfir - Pant Fight this Feeling Anymore.mp3

in the destination folder.

Certain characters in any given id3 tag will be either removed or modified before renaming.
Currently, ",", "&" and "+" will be converted to the string "and". This particular quirk is due to the fact that, again, my motivation for this gem is to rename my own mp3's for easy access on my USB flash drives. So, I want something like "Optiv & Btk" to rename to "Optiv and BTK" (drum and bass fans will know who I'm talking about here). Any other characters are removed, unless they are: alphanumeric, whitespace, parens or "-".

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request