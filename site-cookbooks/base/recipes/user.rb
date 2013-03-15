user node.base.user.name do
  action   :create
  password "$1$3uVcoLeR$lnfAW3PtHJBjk.Pknldad."
  shell    "/bin/bash"
  supports manage_home: true, non_unique: false
end

directory "/home/#{node.base.user.name}" do
  action :create
  owner  'deployer'
  group  'deployer'
end

directory "/home/#{node.base.user.name}/.ssh" do
  action :create
  owner  'deployer'
  group  'deployer'
end

cookbook_file "/home/#{node.base.user.name}/.ssh/authorized_keys" do
  action :create
  owner  'deployer'
  group  'deployer'
  mode   0600
end

directory node.base.www_dir do
  owner  node.base.user.name
  group  node.base.user.name
  mode   0755
  action :create
end
