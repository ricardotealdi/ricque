require 'slogger'

Ricque.logger = Slogger::CommonLogger.new(Ricque.app_name, Ricque.configuration[:log_level], :local7) if Ricque.logger.nil?
