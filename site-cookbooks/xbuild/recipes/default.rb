installs = node['xbuild']['installs']
xbuild_dir  = "/usr/local/bin/xbuild"

directory xbuild_dir

# TODO: Create provider like
# xbuild_install "install perl ..." do
#   language
#   version
#   prefix
# end
installs.each do |install|
  language = install["language"]
  version = install["version"]
  prefix = install["prefix"]

  installer = "#{xbuild_dir}/#{language}-install"
  remote_file installer  do
    source "https://raw.githubusercontent.com/tagomoris/xbuild/master/#{language}-install"
    mode   0755
    action :create_if_missing
  end

  install_dir = "#{prefix}/#{language}-#{version}"
  bash "install #{language} to #{prefix} by #{installer}" do
    code "#{installer} #{version} #{prefix}"
    not_if { File.exists?("#{prefix}/bin/#{language}") }
  end

end
