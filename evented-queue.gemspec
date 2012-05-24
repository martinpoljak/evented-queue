# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "evented-queue"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Martin Koz\u{e1}k"]
  s.date = "2012-05-24"
  s.email = "martinkozak@martinkozak.net"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/evented-queue.rb",
    "lib/evented-queue/abstract.rb",
    "lib/evented-queue/recurring.rb",
    "test"
  ]
  s.homepage = "http://github.com/martinkozak/evented-queue"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Provides queue driven by callbacks so suitable for asynchronous processing environments and its recurring variant for request distribution to more clients or emulating of server behaviour."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<abstract>, [">= 0"])
      s.add_runtime_dependency(%q<unified-queues>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler2>, [">= 2.0.0"])
      s.add_development_dependency(%q<riot>, [">= 0.12.3"])
    else
      s.add_dependency(%q<abstract>, [">= 0"])
      s.add_dependency(%q<unified-queues>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler2>, [">= 2.0.0"])
      s.add_dependency(%q<riot>, [">= 0.12.3"])
    end
  else
    s.add_dependency(%q<abstract>, [">= 0"])
    s.add_dependency(%q<unified-queues>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler2>, [">= 2.0.0"])
    s.add_dependency(%q<riot>, [">= 0.12.3"])
  end
end
