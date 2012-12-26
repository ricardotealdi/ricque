require File.expand_path('../boot', __FILE__)

module Bootstrap
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
    ENV["APP_ROOT"]
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
end
