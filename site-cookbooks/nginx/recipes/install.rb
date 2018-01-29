include_recipe "yum"

yum_repository "nginx" do
  description "nginx"
  baseurl     "http://nginx.org/packages/centos/6/$basearch/"
  gpgkey      "http://nginx.org/keys/nginx_signing.key"
  action      :create
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
