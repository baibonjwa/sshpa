# coding: utf-8
require "./lib/sshpa/version.rb"

Gem::Specification.new do |spec|
  spec.name          = "sshpa"
  spec.version       = Sshpa::VERSION
  spec.authors       = ["happybai"]
  spec.date          = '2017-05-15'
  spec.email         = ["byron.bai@aol.com"]

  spec.summary       = %q{Server login management tool base on sshpass.}
  spec.description   = %q{Server login management tool base on sshpass.}
  spec.homepage      = "https://github.com/happybai/sshpa"
  spec.license       = "MIT"

  spec.files         = ['lib/sshpa/.sshpa.yml.example', 'lib/sshpa.rb', 'lib/sshpa/version.rb', 'bin/sshpa']
  spec.executables   = spec.files.grep(%r{^bin/*}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
