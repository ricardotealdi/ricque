require 'slogger'

AppWorkers.logger = Slogger::CommonLogger.new(AppWorkers.app_name, AppWorkers.configuration[:log_level], :local7) if AppWorkers.logger.nil?
