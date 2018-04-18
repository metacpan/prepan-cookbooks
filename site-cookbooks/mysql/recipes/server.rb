include_recipe "mysql::client"

package "mysql-server" do
  action :install
end

service "mysqld" do
  supports status: true, restart: true, reload: true
  action   [ :enable, :start ]
end
