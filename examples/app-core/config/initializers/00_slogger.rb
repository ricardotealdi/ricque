require 'slogger'

AppCore.logger = Slogger::CommonLogger.new(AppCore.app_name, AppCore.configuration[:log_level], :local7) if AppCore.logger.nil?
