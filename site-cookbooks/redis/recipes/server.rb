package "redis" do
  action :install
end

service "redis" do
  action [:enable, :start]
end
