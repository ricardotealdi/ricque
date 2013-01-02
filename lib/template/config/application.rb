require File.expand_path('../boot', __FILE__)

module Bootstrap
  def self.initialize!
    initializer_files_path = ::File.join(::File.expand_path('initializers', self.config_dir), '**', '*.rb')
    environment_file_path  = ::File.join(::File.expand_path('environments', self.config_dir), "#{self.env}.rb")
    lib_files_path         = ::File.join(::File.expand_path("lib/#{app_name}", self.root), '**', '*.rb')
    environment            = self.env

    if !File.exists?(environment_file_path) 
      puts "Environment file was not found for [#{self.env}]"
      environment = Bootstrap::DEFAULT_ENVIRONMENT
      environment_file_path = ::File.join(::File.expand_path('environments', self.config_dir), "#{Bootstrap::DEFAULT_ENVIRONMENT}.rb")
    end

    load_path environment_file_path, "\s\sLoading environment file for [#{environment}]"

    load_path initializer_files_path, "\s\sLoading initializers"

    load_path lib_files_path, "\s\sLoading application files"

    puts "\s\sExecuting after_initialize_blocks (#{after_initialize_blocks.count})"
    execute_after_initialize!

    nil
  end

  def self.after_initialize &block
    after_initialize_blocks << block
  end

  def self.execute_after_initialize!
    after_initialize_blocks.each(&:call)
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
