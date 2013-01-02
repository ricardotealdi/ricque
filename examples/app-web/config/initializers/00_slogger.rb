require 'slogger'

AppWeb.logger = Slogger::CommonLogger.new(AppWeb.app_name, AppWeb.configuration[:log_level], :local7)
