name "redis"
run_list %w(
  recipe[build-essential]
  recipe[redis::source]
)

default_attributes(
  "redis" => {
    "source" => {
      "version" => "2.6.10"
    },
  },
)
