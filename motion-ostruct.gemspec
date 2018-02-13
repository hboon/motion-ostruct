# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-ostruct/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'motion-ostruct'
  gem.version       = Motion::OpenStruct::VERSION
  gem.licenses      = ['BSD-2-Clause']

  gem.authors  = ['Hwee-Boon Yar']

  gem.description = 'Add variations of attr_accessor for RubyMotion for iOS & macOS'
  gem.summary = gem.description
  gem.homepage = 'https://github.com/hboon/motion-ostruct'
  gem.email = 'hboon@motionobj.com'

  gem.files       = `git ls-files`.split($\)
  gem.require_paths = ['lib']
  gem.test_files  = gem.files.grep(%r{^spec/})
end
