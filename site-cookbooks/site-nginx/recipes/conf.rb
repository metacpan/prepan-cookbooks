template "#{node.nginx.dir}/sites-available/#{node.app.name}.conf" do
  source "#{node.app.name}.conf.erb"
  mode   "0644"
end

nginx_site "#{node.app.name}.conf" do
  action :enable
end
