name "development"
run_list %w(
  role[app]
  role[db]
  role[redis]
)
