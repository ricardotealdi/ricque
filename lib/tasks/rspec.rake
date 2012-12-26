begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = "--require spec_helper"
  end
rescue Exception => ex
  warn "Error during RSpec loading... #{ex}"
end