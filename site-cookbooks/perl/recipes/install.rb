# TODO: Use xbuild_install resource, when I implement resource in xbuild cookbook

# include_recipe "xbuild"

# xbuild_perl "install perl #{node['app']['perl']['version']}" do
#   version node['app']['perl']['version']
#   prefix  node['app']['perl']['prefix']
# end

# node.app.perl.modules.each do |mod|
#   xbuild_cpanm mod do
#     options '--force'
#     perl_root node['app']['perl']['prefix']
#   end
# end

# bash "install carton" do
#   code "/usr/local/perl-prepan/bin/cpanm carton"
# end
