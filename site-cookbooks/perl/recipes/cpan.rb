package "perl-CPAN" do
  notifies :run, "execute[install cpanm]"
  not_if { system('which cpan') }
end

execute "install cpanm" do
  command "cpan App::cpanminus"
  notifies :run, "execute[install modules]"
  not_if { system('which cpanm') }
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

  not_if { system('which carton') }
end
