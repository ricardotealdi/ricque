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
        if RUBY_PLATFORM.downcase.include?("darwin")
           sed_args_platform_specific = "''"
        else
           sed_args_platform_specific = "-e"
        end
        `grep -Irl "Ricque" . | xargs sed -i #{sed_args_platform_specific} 's/Ricque/#{camelized_app_name}/g'`
        `grep -Irl "ricque" . | xargs sed -i #{sed_args_platform_specific} 's/ricque/#{dashesized_app_name}/g'`
        `grep -Irl "{RICQUE_VERSION}" . | xargs sed -i #{sed_args_platform_specific}'s/{RICQUE_VERSION}/#{Ricque::VERSION}/g'`

        puts "Renaming files"
        `find . -name '*ricque*' | sed -e "p;s/ricque/#{dashesized_app_name}/" | xargs -n2 mv`
      end
    end
  end
end