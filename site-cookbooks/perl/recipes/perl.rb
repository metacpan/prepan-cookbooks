package "perl" do
  notifies :run, "package[perl-CPAN]"
end
