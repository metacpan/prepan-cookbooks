package "perl-CPAN" do
  notifies :run, "execute[install cpanm]"
end

execute "install cpanm" do
  command "cpan App::cpanminus"
  notifies :run, "execute[install modules]"
end

execute "install modules" do
  [
    'Module::Install',
    'Module::Install::CPANfile',
    'Module::Install::ReadmeFromPod',
    'Module::Install::Repository',
    'git://github.com/miyagawa/carton.git',
  ].each do |name|
    command "cpanm #{name}"
  end
end
