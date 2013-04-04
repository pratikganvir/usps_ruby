task :install_usps_ruby do
  FileUtils.cp "usps_config.yml", "#{Rails.root}/config/usps_config.yml"
end
