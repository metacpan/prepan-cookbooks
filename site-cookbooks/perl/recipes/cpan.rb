execute "install cpanm" do
  command "curl -L http://cpanmin.us | perl - --self-upgrade"
  not_if { system('which cpanm') }
end

[
  'Module::Install',
  'Module::Install::CPANfile',
  'Module::Install::ReadmeFromPod',
  'Module::Install::Repository',
  'git://github.com/miyagawa/carton.git',
].each do |name|
  execute "install #{name}" do
    command "cpanm -n -f #{name}"
  end
end
