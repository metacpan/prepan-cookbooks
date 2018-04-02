name "app"
run_list %w(
  role[base]
  recipe[sudo]
  recipe[mackerel]
  recipe[nginx]
  recipe[xbuild]
  recipe[perl]
  recipe[mysql::client]
  recipe[daemontools]
  recipe[logrotate]
)

override_attributes(
  "authorization" =>  {
    "sudo" => {
      "groups" => ["admin", "wheel"],
      "users"  => ["deployer"],
    }
  },

  "app" => {
    "services" => %w(web worker),
    "name"     => "prepan",
    "domain"   => "prepan.org",
    "server"   => {
      "host"   => "127.0.0.1",
      "port"   => "8000",
    },
    "nginx"    => {
      "port"   => "80",
    },
    "perl"     => {
      "version" => "5.16.3",
      'prefix'  => '/usr/local/perl-prepan',
      "modules" => %w[
        Module::Install
        Module::Install::CPANfile
        Module::Install::ReadmeFromPod
        Module::Install::Repository
        git://github.com/miyagawa/carton.git
      ]
    }
  },

  "xbuild" => {
    "installs" => [
      { "language" => "perl", "version" => "5.16.3", "prefix" => "/usr/local/perl-prepan"},
    ],
  },

  "mackerel-agent" => {
    "conf" => {
      "roles" => ["prepan:app"],
    },
  },
)
