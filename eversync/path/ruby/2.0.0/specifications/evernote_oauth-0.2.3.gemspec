# -*- encoding: utf-8 -*-
# stub: evernote_oauth 0.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "evernote_oauth"
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Evernote"]
  s.date = "2014-01-13"
  s.description = "evernote_oauth is a Ruby client for the Evernote API using OAuth and Thrift."
  s.email = "api@evernote.com"
  s.homepage = "http://github.com/evernote/evernote-oauth-ruby"
  s.licenses = ["BSD 2-Clause"]
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.rubyforge_project = "evernote_oauth"
  s.rubygems_version = "2.4.6"
  s.summary = "Ruby client for the Evernote API using OAuth and Thrift."

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, [">= 0.4.1"])
      s.add_runtime_dependency(%q<evernote-thrift>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<redcarpet>, [">= 0"])
    else
      s.add_dependency(%q<oauth>, [">= 0.4.1"])
      s.add_dependency(%q<evernote-thrift>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0.4.1"])
    s.add_dependency(%q<evernote-thrift>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
  end
end
