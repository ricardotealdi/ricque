desc "Load Ricque environment"
task :environment do
  require File.expand_path('config/environment', Ricque.root)
end