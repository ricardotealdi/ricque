desc "Load Bootstrap environment"
task :environment do
  require File.expand_path('config/environment', Bootstrap.root)
end