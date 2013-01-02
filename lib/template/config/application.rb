require File.expand_path('../boot', __FILE__)

module Bootstrap
  @@initialized = false

  def self.initialize!
    return if @@initialized

    puts "=" * 70
    puts "Loading Bootstrap"
    started_at = Time.now

    initializer_files_path = ::File.join(::File.expand_path('initializers', self.config_dir), '**', '*.rb')
    environment_file_path  = ::File.join(::File.expand_path('environments', self.config_dir), "#{self.env}.rb")
    lib_files_path         = ::File.join(::File.expand_path("lib/#{app_name}", self.root), '**', '*.rb')
    environment            = self.env

    if !File.exists?(environment_file_path) 
      puts "\tEnvironment file was not found for [#{self.env}]"
      environment = Bootstrap::DEFAULT_ENVIRONMENT
      environment_file_path = ::File.join(::File.expand_path('environments', self.config_dir), "#{Bootstrap::DEFAULT_ENVIRONMENT}.rb")
    end

    load_path environment_file_path, "\tLoading environment file for [#{environment}]"

    load_path initializer_files_path, "\tLoading initializers"

    load_path lib_files_path, "\tLoading application files"

    puts "\tExecuting after_initialize_blocks (#{after_initialize_blocks.count})"
    execute_after_initialize!

    puts "\tApplication Bootstrap loaded on environment \"#{ENV["RUBY_ENV"]}\" in #{Time.now - started_at} seconds"
    puts "Bootstrap loaded"
    puts "=" * 70

    @@initialized = true

    nil
  end

  def self.initialized?
    @@initialized
  end

  def self.after_initialize &block
    after_initialize_blocks << block
  end

  def self.execute_after_initialize!
    after_initialize_blocks.each(&:call)
  end

  def self.configure &block
    block.call configuration
  end

  def self.configuration
    @@config ||= {}
    @@config
  end

  def self.logger= logger
    configuration[:logger] = logger
  end

  def self.logger
    configuration[:logger]
  end

  def self.logger?
    !configuration[:logger].nil?
  end

  def self.development?
    ENV["RUBY_ENV"] == "development"
  end

  def self.load_tasks
    tasks_files = ::File.join(::File.expand_path('lib/tasks', self.root), '**', '*.rake')

    ::Dir[tasks_files].each { |it| import it }
  end

  private

  def self.after_initialize_blocks
    @@after_initialize_blocks ||= []
    @@after_initialize_blocks
  end

  def self.load_path path, message
    files = ::Dir[path]
    puts "#{message} (#{files.size})"
    files.each { |file| load file }
  end
end
