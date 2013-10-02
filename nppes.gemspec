# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nppes/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Jenua Boiko']
  gem.email         = ['jeyboy1985@gmail.com']
  gem.description   = %Q{}
  gem.summary       = %Q{}
  gem.homepage      = ''

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nppes"
  gem.require_paths = ['lib']
  gem.version       = Nppes::VERSION
  gem.rubygems_version = %q{1.8.6}
  gem.license = 'MIT'


  gem.add_dependency('rails', '>= 3.0.0')
  gem.add_dependency('rubyzip')
  gem.add_dependency('nokogiri')
  gem.add_dependency('delayed_job_active_record')
  gem.add_dependency('daemons')
end

