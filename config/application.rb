require File.expand_path('../boot', __FILE__)

module Bootstrap
  def self.initialize!
    initializer_files_path = ::File.join(::File.expand_path('initializers', self.config_dir), '**', '*.rb')
    environment_file_path  = ::File.join(::File.expand_path('environments', self.config_dir), "#{ENV["RUBY_ENV"]}.rb")
    lib_files_path         = ::File.join(::File.expand_path("lib/#{app_name}", self.root), '**', '*.rb')
    environment            = self.env

    if !File.exists?(environment_file_path) 
      puts "Environment file was not found for [#{ENV["RUBY_ENV"]}]"
      environment = DEFAULT_ENVIRONMENT
      environment_file_path = ::File.join(::File.expand_path('environments', self.config_dir), "#{DEFAULT_ENVIRONMENT}.rb")
    end

    load_path environment_file_path, "Loading environment file for [#{environment}]"

    load_path initializer_files_path, "Loading initializers"

    load_path lib_files_path, "Loading application file"

    nil
  end

  def self.app_name
    ENV["APP_NAME"]
  end

  def self.lib_dir
    ENV["LIB_DIR_#{app_name}"]
  end

  def self.config_dir
    ENV["CONFIG_ROOT_#{app_name}"]
  end

  def self.config
    @@config ||= {}
    @@config
  end

  def self.logger= logger
    config[:logger] = logger
  end

  def self.logger
    config[:logger]
  end

  def self.logger?
    !config[:logger].nil?
  end

  def self.development?
    ENV["RUBY_ENV"] == "development"
  end

  def self.root
    ENV["APP_ROOT#{app_name}"]
  end

  def self.env
    ENV["RUBY_ENV"]
  end

  def self.groups
    ENV["BUNDLER_GROUPS"].split(',')
  end

  def self.load_tasks
    tasks_files = ::File.join(::File.expand_path('lib/tasks', self.root), '**', '*.rake')

    ::Dir[tasks_files].each { |it| import it }
  end

  private

  def self.load_path path, message
    files = ::Dir[path]
    puts "#{message} (#{files.size})"
    files.each { |file| load file }
  end
end
