# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cancan_config/version'

Gem::Specification.new do |gem|
  gem.name          = "cancan_config"
  gem.version       = CanCanConfig::VERSION
  gem.authors       = ["jiangzhi.xie"]
  gem.email         = ["xiejiangzhi@gmail.com"]
  gem.description   = %q{config cancan roles}
  gem.summary       = %q{config cancan roles}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
