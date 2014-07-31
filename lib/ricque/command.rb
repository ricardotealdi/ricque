module Ricque
  class Command < Thor
    register(
      Template, 'new',
      'new [PROJECT_NAME]',
      "Create a template app \n  Options:\n\n" \
      "    --test-framework=rspec (default: rspec)\n" \
      '    --app-server=unicorn (default: none)'
    )
  end
end
