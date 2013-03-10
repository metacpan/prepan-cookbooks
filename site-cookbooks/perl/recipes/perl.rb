package "perl" do
  notifies :run, "execute[install cpanm]"
end
