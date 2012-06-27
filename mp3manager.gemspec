# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mp3manager/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Danny Holyfield"]
  gem.email         = ["shyguyncdnb@gmail.com"]
  gem.description   = %q{A simple mp3 renamer and organizer, based on id3v2 tags}
  gem.summary       = %q{If you're nice, I'll tell you how to use it!}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mp3manager"
  gem.require_paths = ["lib"]
  gem.version       = Mp3manager::VERSION

  gem.add_development_dependency "rake"
  gem.add_dependency "mp3info"
end
