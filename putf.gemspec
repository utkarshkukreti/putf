# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "putf/version"

Gem::Specification.new do |s|
  s.name        = "putf"
  s.version     = Putf::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Utkarsh Kukreti"]
  s.email       = ["utkarshkukreti@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Uploads files to your server with a single command, and copies its URL to your clipboard.}
  s.description = %q{Uploads files to your server with a single command, and copies its URL to your clipboard.}

  s.rubyforge_project = "putf"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~>2.5.0"
end
