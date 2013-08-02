require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

if `gem list`.lines.grep(/^mysql2 \(.*\)/) and ENV['DATABASE_URL']
  ENV['DATABASE_URL'] = ENV['DATABASE_URL'].sub(/mysql:/, 'mysql2:')
end
