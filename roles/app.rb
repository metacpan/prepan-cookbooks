name "app"
run_list %w(
  role[base]
  recipe[nginx]
  recipe[site-nginx]
)

default_attributes(
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
