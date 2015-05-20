# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-imgur/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kirk Okada"]
  gem.email         = ["kirkokada@gmail.com"]
  gem.description   = %q{OmniAuth strategy for Imgur.}
  gem.summary       = %q{OmniAuth strategy for Imgur.}
  gem.homepage      = "https://github.com/kirkokada/omniauth-instagram"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-imgur"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Imgur::VERSION

  gem.add_dependency 'omniauth', '~> 1'
  gem.add_dependency 'omniauth-oauth2', '~> 1'
  gem.add_development_dependency 'rspec', '~> 2.12'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
