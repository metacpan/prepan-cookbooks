name "base"
run_list %w(
  recipe[base]
  recipe[yum::yum]
  recipe[build-essential]
)

default_attributes(
  "base" => {
    "user" => {
      "name"    => "deployer",
    },
    "www_dir" => "/var/www",
  },
)
