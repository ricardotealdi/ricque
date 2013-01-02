require 'app-core'

AppCore.logger = AppWorkers.logger

AppCore.before_initialize do
  AppCore.config_dir = AppWorkers.config_dir
end

AppCore.initialize!