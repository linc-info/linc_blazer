server 'staging_blazer', user: "deploy", roles: %w{app db web}
set :rails_env, "production"
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp