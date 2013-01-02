require 'resque'

AppWorkers.configure do |config| 
  config[:resque] = YAML.load_file("#{AppWorkers.config_dir}/redis.yml")[AppWorkers.env]
end

Resque.redis = "#{AppWorkers.configuration[:resque]['host']}/#{AppWorkers.configuration[:resque]['namespace']}"
