name "redis"
run_list %w(
  role[base]
  recipe[redis::source]
)

default_attributes(
  "redis" => {
    "source" => {
      "version" => "2.6.10"
    },
  },
)
