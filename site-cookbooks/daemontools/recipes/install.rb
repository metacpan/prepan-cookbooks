execute "install daemontools" do
  command <<-COMMAND
rpm -ivh http://mirrors.qmailtoaster.com/daemontools-toaster-0.76-1.3.6.src.rpm &&
rpmbuild -ba /root/rpmbuild/SPECS/daemontools-toaster.spec &&
rpm -ivh /root/rpmbuild/RPMS/x86_64/daemontools-toaster-0.76-1.3.6.x86_64.rpm
COMMAND
  not_if { system("rpm -q daemontools-toaster") }
end

cookbook_file "/etc/init/svscan.conf" do
  action   :create
  notifies :run, "execute[svscan]"
end

execute "svscan" do
  command <<-COMMAND
initctl reload-configuration
initctl start svscan
COMMAND
  not_if { system("initctl status svscan") }
end
