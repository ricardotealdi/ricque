module Ricque
  class Template < Thor::Group
    include Thor::Actions

    argument :project, type: :string
    class_option :test_framework, default: 'rspec'
    class_option :app_server, default: 'none'

    def self.source_root(path = nil)
      @_source_root = path if path
      @_source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def structure
      directory('.', dest_dir, recursive: false)
    end

    def config_dir
      directory('config', dest_dir('config'))
    end

    def app_dir
      directory('app', dest_dir('app'))
    end

    def lib_dir
      directory('lib', dest_dir('lib'))
    end

    def script_dir
      directory('script', dest_dir('script'))
      chmod(dest_dir('script/console'), 'a+x')
    end

    def rspec
      return unless options[:test_framework] == 'rspec'
      directory('rspec', dest_dir)
      append_to_file(dest_dir('Gemfile')) do
        "\ngroup :test do\n" \
          "  gem 'rspec'\n" \
          "  gem 'simplecov'\n" \
          "  gem 'simplecov-rcov'\n" \
          'end'
      end
    end

    def finish
      say("\n === App #{project} created in #{full_path}")
    end

    private

    def full_path
      File.expand_path(dest_dir)
    end

    def dest_dir(path = nil)
      dest = project.downcase
      dest << "/#{path}" if path
      dest
    end
  end
end
