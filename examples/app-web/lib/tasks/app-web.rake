desc "Load AppWeb environment"
task :environment do
  require File.expand_path('config/environment', AppWeb.root)
end
