# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'open_project/zendesk/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-zendesk"
  s.version     = OpenProject::Zendesk::VERSION
  s.authors     = "SPIDAWeb LLC"
  s.email       = "info@spidasoftware.com"
  s.summary     = 'OpenProject Zendesk Integration'
  s.description = 'Integrates OpenProject and Zendesk for a better workflow'
  s.license     = 'GPLv3'

  s.files = Dir["{app,config,db,doc,lib}/**/*"] + %w(README.md)

  s.add_dependency "rails", "~> 3.2.14"
  s.add_dependency "openproject-plugins", "~> 1.0.6"
  s.add_dependency "openproject-webhooks", "~> 1.0"
end
