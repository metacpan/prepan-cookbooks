include_recipe "mysql::client"

package "mysql-server" do
  action :install
end

execute "mysql-install-db" do
  command "mysql_install_db"
  action  :run
  not_if  { File.exists?('/var/lib/mysql/mysql/user.frm') }
end

service "mysqld" do
  supports status: true, restart: true, reload: true
  action   [ :enable, :start ]
end
