require 'slogger'

Bootstrap.logger = Slogger::CommonLogger.new("bootstrap", Bootstrap.config[:log_level], :local7)