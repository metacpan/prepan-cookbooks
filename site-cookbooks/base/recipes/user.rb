user node.base.user.name do
  action   :create
  password "$1$3uVcoLeR$lnfAW3PtHJBjk.Pknldad."
  notifies :run, "directory[#{node.base.www_dir}]"
end

directory node.base.www_dir do
  owner  node.base.user.name
  group  node.base.user.name
  mode   0644
  action :create
end
