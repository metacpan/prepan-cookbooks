plenv_install node.perl.version do
  user node.base.user.name
end

plenv_global node.perl.version do
  user node.base.user.name
end

plenv_install_cpanm node.perl.version do
  user node.base.user.name
end

node.perl.modules.each do |mod|
  plenv_cpanm mod do
    user    user node.base.user.name
    version node.perl.version
    options "--force"
  end
end
