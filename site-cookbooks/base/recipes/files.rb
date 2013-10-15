directory "/var/log/#{node.app.name}" do
  owner 'deployer'
  group 'deployer'
  mode  0755
  action :create
end
