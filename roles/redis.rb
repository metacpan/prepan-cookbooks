name "redis"
run_list %w(
  role[base]
  recipe[redis::source]
)

default_attributes(
  "redis" => {
    "bind"   => "0.0.0.0",
    "source" => {
      "tar_url" => "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/redis/redis-2.6.10.tar.gz",
      "tar_checksum" => "0b930976830afaad40274107a36f9aae0d8a8fbbdea4e566d20765ee502c2a22",
      "version" => "2.6.10",
    },
  },
)
