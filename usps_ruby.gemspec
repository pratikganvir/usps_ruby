Gem::Specification.new do |spec|
  spec.name        = 'usps_ruby'
  spec.version     = '0.0.0'
  spec.date        = '2013-03-28'
  spec.summary     = "Gem for USPS api."
  spec.description = "Track USPS shipment."
  spec.authors     = ["Pratik Ganvir"]
  spec.email       = 'pratikganvir@yahoo.in'
  spec.files       = ["lib/usps_ruby.rb","lib/usps_ruby/credentials/credentials.rb", "lib/usps_ruby/web_interface/usps_call.rb", "lib/tasks/rakefile.rb"]
  spec.add_dependency('nokogiri', '>= 1.5.2')
  spec.add_dependency('rake', '>= 0.9')
  spec.homepage    = 'http://rubygems.org/gems/dhl_memnosyne'
end
