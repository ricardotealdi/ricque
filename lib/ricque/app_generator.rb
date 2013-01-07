module Ricque
  class AppGenerator
    def initialize app_name, path=File.expand_path('.')
      @app_name     = app_name
      @path         = path
    end

    def app_path
      File.join(@path, dashesized_app_name)
    end

    def camelized_app_name
      @app_name.camelize
    end

    def dashesized_app_name
      @app_name.dasherize
    end

    def template_path
      Ricque.template_path
    end

    def create!
      create_path
      copy_files
      puts "Application created on path #{app_path}"
    end

    private

    def create_path
      puts "Creating path #{app_path}"
      if Dir.exists?(app_path)
        puts "Path #{app_path} already exists"
        raise ArgumentError, "Path #{app_path} already exists"
      end

      Dir.mkdir app_path
    end

    def copy_files
      Dir.chdir(app_path) do
        puts "Copying files"
        FileUtils.cp_r template_path, ".", :preserve => true
        puts "Renaming file content"
        `grep -Irl "Ricque" . | xargs sed -i '' 's/Ricque/#{camelized_app_name}/g'`
        `grep -Irl "ricque" . | xargs sed -i '' 's/ricque/#{dashesized_app_name}/g'`
        `grep -Irl "{RICQUE_VERSION}" . | xargs sed -i '' 's/{RICQUE_VERSION}/#{Ricque::VERSION}/g'`
        puts "Renaming files"
        FileUtils.mv 'lib/ricque', "lib/#{dashesized_app_name}"
        FileUtils.mv "lib/ricque.rb", "lib/#{dashesized_app_name}.rb"
        FileUtils.mv "lib/tasks/ricque.rake", "lib/tasks/#{dashesized_app_name}.rake"
      end
    end
  end
end