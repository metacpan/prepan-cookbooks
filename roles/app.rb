name "app"
run_list %w(role[base] recipe[nginx])
