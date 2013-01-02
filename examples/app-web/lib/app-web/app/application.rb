module AppWeb
  class Application < Sinatra::Base
    helpers do
      def request_headers
        env
          .inject({}){|acc, (k,v)| acc[$1.gsub('_', '-').downcase] = v if k =~ /^http_(.*)/i; acc}
          .select { |k,v| !['cookie', 'version'].include? k.downcase }
      end
    end

    before do
      env['began_at'] = Time.now
      message = "\nStarted #{request.request_method} \"#{request.path}\" for #{request.ip} at #{env['began_at']}"
      message << "\n\tHeaders: #{request_headers}"
      request_body = request.body.read
      request.body.rewind
      message << "\n\tBody: #{request_body}" unless request_body.empty?
      AppWeb.logger.info message
    end

    after do 
      elapsed = (Time.now - env['began_at'])
      AppWeb.logger.info "\nCompleted #{request.request_method} \"#{request.path}\" with status #{response.status} in #{elapsed} seconds\n\tHeaders: #{response.headers}"
    end
  end
end