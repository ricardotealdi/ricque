puts "=" * 70
puts "Loading Bootstrap"
started_at = Time.now

require File.expand_path('../application', __FILE__)

Bootstrap.initialize!

puts "Application loaded on environment \"#{ENV["RUBY_ENV"]}\" in #{Time.now - started_at} seconds"
puts "Bootstrap loaded"
puts "=" * 70
