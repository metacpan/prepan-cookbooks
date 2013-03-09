Dir.glob("#{File.dirname(__FILE__)}/*.rb") do |file|
  next if file =~ /default\.rb$/
  file_name = file.scan(/([^\/]+)\.rb$/)[0].first
  include_recipe "perl::#{file_name}"
end
