module AppWeb
  class Application < Sinatra::Base

    get '/foos' do
      AppCore::Foo.all.to_json
    end
  end
end