Ricque
======

Ricque is a generator of ruby applications with bootstrap similar to [Rails]' bootstrap.

To generate a new application, you should run the following command on your terminal:

    $ gem install ricque
    $ ricque new [your-application-name]

This command will create a new directory, based on app name, with all files needed to start your project.

	app-name
	├── config
	│   ├── application.rb
	│   ├── boot.rb
	│   ├── environment.rb
	│   ├── environments
	│   │   ├── development.rb
	│   │   ├── production.rb
	│   │   └── test.rb
	│   └── initializers
	│       └── 00_logger.rb
	├── doc
	│   └── README_FOR_APP
	├── Gemfile
	├── Gemfile.lock
	├── lib
	│   ├── app-name
	│   │   └── version.rb
	│   ├── app-name.rb
	│   └── tasks
	│       ├── app-name.rake
	│       └── rspec.rake
	├── Rakefile
	├── README
	├── script
	│   └── console
	└── spec
	    └── spec_helper.rb




Creator
---------------

**Ricardo Tealdi**

License
---------------

Ricque is released under the [MIT License]

  [Rails]: https://github.com/rails/rails
  [MIT License]: http://www.opensource.org/licenses/MIT