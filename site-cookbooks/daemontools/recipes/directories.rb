node.app.services.each do |name|
  directory "/service/#{name}" do
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
