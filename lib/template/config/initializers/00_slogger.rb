require 'slogger'

Bootstrap.logger = Slogger::CommonLogger.new(Bootstrap.app_name, Bootstrap.configuration[:log_level], :local7) if Bootstrap.logger.nil?
