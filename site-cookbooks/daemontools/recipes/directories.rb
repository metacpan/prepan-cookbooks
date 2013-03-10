directory "/service" do
  action :create
  owner  'root'
  group  'root'
  mode   0755
end

node.app.services.each do |name|
  directory "/service/#{name}" do
    action :create
    owner  'deployer'
    group  'deployer'
    mode   0755
  end

  directory "/service/#{name}/log" do
    action :create
    owner  'deployer'
    group  'deployer'
    mode   0755
  end

  directory "/service/#{name}/log/main" do
    action :create
    owner  'deployer'
    group  'deployer'
    mode   0755
  end
end
