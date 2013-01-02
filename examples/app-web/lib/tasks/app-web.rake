desc "Load AppWeb environment"
task :environment do
  require File.expand_path('config/environment', AppWeb.root)
end


desc "Show routes"
task :routes => :environment do
  puts "\n"
  AppWeb::Application.routes.each do |verb, handlers|
    handlers.each do |handler|
      puts "#{verb} #{handler[0].source.to_s}"
    end
  end
end