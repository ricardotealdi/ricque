Ricque
======

[![Build Status](https://travis-ci.org/ricardotealdi/ricque.svg?branch=master)](https://travis-ci.org/ricardotealdi/ricque)


Ricque is a generator of ruby applications with bootstrap similar to [Rails]'
bootstrap.

**The generated app does not have the ricque gem as a dependency.**

To generate a new application, you should run the following command on your
terminal:

    $ gem install ricque
    $ ricque new [your-application-name]

This command will create a new directory, based on app name, with all files
needed to start your project.

	app-name
	├── .gitignore
	├── .rspec
	├── .rubocop.yml
	├── .ruby-version
	├── app
	├── config
	│   ├── application.rb
	│   ├── boot.rb
	│   ├── environment.rb
	│   └── initializers
	├── Gemfile
	├── lib
	│   └── tasks
	│       └── app-name.rake
	├── Rakefile
	├── README.md
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
