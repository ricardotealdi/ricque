desc "Load AppWorkers environment"
task :environment do
  require File.expand_path('config/environment', AppWorkers.root)
end
