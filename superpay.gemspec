# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'superpay/version'

Gem::Specification.new do |spec|
  spec.name          = "superpay"
  spec.version       = Superpay::VERSION
  spec.authors       = ["QW3 Software & Marketing"]
  spec.email         = ["contato@qw3.com.br"]
  spec.description   = %q{Gem de integração com o gateway de pagamentos Superpay}
  spec.summary       = %q{Projeto extraído da construção da plataforma de e-commerce Profit, da QW3.}
  spec.homepage      = "https://github.com/qw3/superpay"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'brdinheiro'
  spec.add_dependency 'brdata'
  spec.add_dependency 'savon', '2.2'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest', '>= 5.0'
end
