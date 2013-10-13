package "logrotate" do
  action :install
end

template "/etc/logrotate.d/#{node.app.name}" do
  action :create
  source "#{node.app.name}.erb"
  mode "0644"
end
