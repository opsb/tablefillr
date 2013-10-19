# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

SAFE_ENV = Proc.new do |name|
  ENV[name].tap{ |value| raise "Environment variable #{name} is missing" unless value }
end