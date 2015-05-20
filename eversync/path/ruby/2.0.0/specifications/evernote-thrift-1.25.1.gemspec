# -*- encoding: utf-8 -*-
# stub: evernote-thrift 1.25.1 ruby lib

Gem::Specification.new do |s|
  s.name = "evernote-thrift"
  s.version = "1.25.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Evernote"]
  s.date = "2013-11-18"
  s.description = "This SDK contains wrapper code used to call the Evernote Cloud API from Ruby."
  s.email = "api@evernote.com"
  s.homepage = "http://github.com/evernote/evernote-sdk-ruby"
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.rubyforge_project = "evernote-sdk-ruby"
  s.rubygems_version = "2.4.6"
  s.summary = "This SDK contains wrapper code used to call the Evernote Cloud API from Ruby."

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, ["~> 1.3.0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<fakeweb>, ["~> 1.3.0"])
  end
end
