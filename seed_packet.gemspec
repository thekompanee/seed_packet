# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seed_packet/version'

Gem::Specification.new do |spec|
  spec.name             = 'seed_packet'

  spec.version          = SeedPacket::VERSION

  spec.authors          = ['jfelchner']
  spec.email            = ['accounts+git@thekompanee.com']

  spec.homepage         = 'https://github.com/thekompanee/seed_packet'
  spec.license          = 'MIT'

  spec.summary          = %q{Easy creation of seed and sample data.}

  spec.rdoc_options     = ['--charset', 'UTF-8']
  spec.extra_rdoc_files = %w{README.md}

  spec.executables      = Dir['{bin}/**/*'].map {|dir| dir.gsub!(%r{\Abin/}, '')}
  spec.files            = Dir['{app,config,db,lib}/**/*'] + %w{Rakefile README.md}
  spec.test_files       = Dir['{test,spec,features}/**/*']
  spec.require_paths    = ['lib']
end
