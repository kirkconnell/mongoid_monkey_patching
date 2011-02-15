# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongoid_patches/version"

Gem::Specification.new do |s|
  s.name        = "mongoid_patches"
  s.version     = Mongoid::Patches::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Carlos Kirkconnell"]
  s.email       = ["carlos.kirkconnell@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/mongoid_patches"
  s.summary     = %q{Patches that fix mongoid issues.}
  s.description = %q{Fix the issue of handling the nested attributes for embedded documents.}

  s.rubyforge_project = "mongoid_patches"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
