require 'yaml'
begin
  CONFIGURATION = YAML.load_file("#{Rails.root}/config/dhl_config.yml")[RAILS_ENV]
rescue
  puts "Confuration file not found. Run rake install_usps_ruby."
end
