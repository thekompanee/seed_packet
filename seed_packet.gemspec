# encoding: utf-8
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
  spec.licenses      = ['MIT']

  spec.cert_chain    = ['certs/thekompanee.pem']
  spec.signing_key   = File.expand_path('~/.gem/certs/thekompanee-private_key.pem') if $0 =~ /gem\z/

  spec.executables   = []
  spec.files         = Dir['{app,config,db,lib,templates}/**/*'] + %w{README.md LICENSE.txt}

  spec.metadata      = {
    'allowed_push_host' => 'https://rubygems.org',
    'bug_tracker_uri'   => 'https://github.com/thekompanee/seed_packet/issues',
    'changelog_uri'     => 'https://github.com/thekompanee/seed_packet/blob/master/CHANGELOG.md',
    'documentation_uri' => 'https://github.com/thekompanee/seed_packet/tree/releases/v#{::SeedPacket::VERSION}',
    'homepage_uri'      => 'https://github.com/thekompanee/seed_packet',
    'source_code_uri'   => 'https://github.com/thekompanee/seed_packet',
    'wiki_uri'          => 'https://github.com/thekompanee/seed_packet/wiki',
  }


  spec.add_development_dependency 'rspec',     ["~> 3.5"]
  spec.add_development_dependency 'rspeckled', ["~> 0.0"]
end
