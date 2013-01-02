require 'app-workers'

AppWorkers.logger = AppWeb.logger

AppWorkers.before_initialize do
  AppWorkers.config_dir = AppWeb.config_dir
end

AppWorkers.initialize!