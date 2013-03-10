user node.base.user.name do
  action   :create
  password "$1$3uVcoLeR$lnfAW3PtHJBjk.Pknldad."
  supports manage_home: true, non_unique: false
  notifies :run, "directory[#{node.base.www_dir}]"
end

directory "/home/deployer/.ssh" do
  action :create
  owner  'deployer'
  group  'deployer'
end

cookbook_file "/home/deployer/.ssh/authorized_keys" do
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
