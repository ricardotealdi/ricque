desc "Load AppCore environment"
task :environment do
  require File.expand_path('config/environment', AppCore.root)
end
