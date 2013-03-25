plenv_install node.app.perl.version do
  user node.base.user.name
  action :install
end

plenv_global node.app.perl.version do
  user node.base.user.name
  action :run
end

node.app.perl.modules.each do |mod|
  plenv_cpanm mod do
    user    user node.base.user.name
    version node.app.perl.version
    options "--force"
    action  :install
  end
end
