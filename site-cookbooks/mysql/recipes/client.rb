%w{mysql mysql-devel}.each do |package_name|
  package package_name do
    action :install
  end
end
