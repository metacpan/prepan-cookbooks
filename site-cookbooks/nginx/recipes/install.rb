include_recipe "yum"

yum_key "nginx" do
  url 'http://nginx.org/keys/nginx_signing.key'
  action :add
end

yum_repository "nginx" do
  repo_name "nginx"
  url       "http://nginx.org/packages/centos/#{node['platform_version'].to_i}/$basearch/"
end

package "nginx" do
  action :install
end

template "/etc/nginx/conf.d/#{node.app.name}.conf" do
  action   :create
  source   "#{node.app.name}.conf.erb"
  mode     "0644"
  notifies :reload, "service[nginx]"
end

service "nginx" do
  action [:enable, :start]
end
