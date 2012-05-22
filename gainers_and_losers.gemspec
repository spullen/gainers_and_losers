# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gainers_and_losers/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Pullen"]
  gem.email         = ["s.pullen05@gmail.com"]
  gem.description   = %q{Wrapper of Yahoo's finance gainers and losers}
  gem.summary       = %q{Wrapper of Yahoo's finance gainers and losers}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gainers_and_losers"
  gem.require_paths = ["lib"]
  gem.version       = GainersAndLosers::VERSION
  
  gem.add_development_dependency 'rspec', '~> 2.10.0'
  gem.add_development_dependency 'timecop', '~> 0.3.5'
  
  gem.add_dependency 'nokogiri', '~> 1.5.2'
end
