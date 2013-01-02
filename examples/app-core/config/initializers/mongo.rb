require 'mongo_mapper'

AppCore.configure do |config|
  config[:mongo] = YAML.load_file("#{AppCore.config_dir}/mongo.yml")[AppCore.env].symbolize_keys
end

connection = case AppCore.configuration[:mongo][:connection_type]
when 'normal'
  Mongo::Connection.new(AppCore.configuration[:mongo][:server], nil, :logger => AppCore.logger)
when 'replica_set'
  Mongo::ReplSetConnection.new(AppCore.configuration[:mongo][:servers])
end

AppCore.after_initialize do
  MongoMapper.connection  = connection
  MongoMapper.database    = AppCore.configuration[:mongo][:database]
end

