name "app"
run_list %w(
  role[base]
  recipe[sudo]
  recipe[nginx]
  recipe[site-nginx]
  recipe[perl]
  recipe[mysql::client]
  recipe[daemontools]
)

default_attributes(
  "authorization" =>  {
    "sudo" => {
      "groups" => ["admin", "wheel"],
      "users"  => ["vagrant", "deployer"],
    }
  },

  "app" => {
    "name"   => "prepan",
    "domain" => "prepan.org",
    "server" => {
      "host" => "127.0.0.1",
      "port" => "8000",
    },
    "nginx"  => {
      "port" => "80",
    },
  },
)
