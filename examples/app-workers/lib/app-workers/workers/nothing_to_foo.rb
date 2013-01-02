module AppWorkers
  class NothingToFoo
    @queue = :nothing

    def self.perform
      AppWorkers.logger.info "Starting"
      total_found = AppCore::Foo.count
      AppWorkers.logger.info "#{total_found} foo found"
      AppWorkers.logger.info "Finished"
    end
  end
end