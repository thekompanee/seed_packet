# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seed_packet/version'

Gem::Specification.new do |spec|
  spec.name          = 'seed_packet'
  spec.version       = SeedPacket::VERSION
  spec.authors       = ['jfelchner']
  spec.email         = ['accounts+git@thekompanee.com']
  spec.summary       = %q{Easy creation of seed and sample data.}
  spec.description   = %q{}
  spec.homepage      = 'https://github.com/thekompanee/seed_packet'
  spec.license       = 'MIT'

  spec.cert_chain    = %w{certs/thekompanee.pem}
  spec.signing_key   = File.expand_path('~/.gem/certs/thekompanee-private_key.pem') if $0 =~ /gem\z/

  spec.executables   = []
  spec.files         = Dir['{app,config,db,lib}/**/*'] + %w{Rakefile README.md LICENSE.txt}

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.add_development_dependency 'rspec', ["~> 3.5"]
  spec.add_development_dependency 'rspeckled', ["~> 0.0"]
end
