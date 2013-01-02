module AppCore
  class Foo
    include MongoMapper::Document

    key :bar, String, :required => true
  end
end