puts "=" * 70
started_at = Time.now

require File.expand_path('../application', __FILE__)

Bootstrap.initialize!

puts "Application loaded on environment \"#{ENV["RUBY_ENV"]}\" in #{Time.now - started_at} seconds"
puts "=" * 70