name "redis"
run_list %w(
  role[base]
  recipe[redis::source]
)

default_attributes(
  "redis" => {
    "bind"   => "0.0.0.0",
    "source" => {
      "version" => "2.6.10",
    },
  },
)
