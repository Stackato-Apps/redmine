source 'https://rubygems.org'

gem "rails", "3.2.19"
gem "jquery-rails", "~> 3.1.1"
gem "coderay", "~> 1.1.0"
gem "fastercsv", "~> 1.5.0", :platforms => [:mri_18, :mingw_18, :jruby]
gem "builder", ">= 3.0.4"
gem "request_store", "1.0.5"
gem "mime-types"
gem "rbpdf", "~> 1.18.1"
gem "thin"

# Optional gem for LDAP authentication
group :ldap do
  gem "net-ldap", "~> 0.3.1"
end

# Optional gem for OpenID authentication
group :openid do
  gem "ruby-openid", "~> 2.3.0", :require => "openid"
  gem "rack-openid"
end

platforms :mri, :mingw do
  # Optional gem for exporting the gantt to a PNG file, not supported with jruby
  group :rmagick do
    # RMagick 2 supports ruby 1.9
    # RMagick 1 would be fine for ruby 1.8 but Bundler does not support
    # different requirements for the same gem on different platforms
    gem "rmagick", ">= 2.0.0"
  end

  # Optional Markdown support, not for JRuby
  group :markdown do
    # TODO: upgrade to redcarpet 3.x when ruby1.8 support is dropped
    gem "redcarpet", "~> 2.3.0"
  end
end

platforms :jruby do
  # jruby-openssl is bundled with JRuby 1.7.0
  gem "jruby-openssl" if Object.const_defined?(:JRUBY_VERSION) && JRUBY_VERSION < '1.7.0'
  gem "activerecord-jdbc-adapter", "~> 1.3.2"
end

gem "mysql2", "~> 0.3.11", :platforms => [:mri, :mingw]
gem "activerecord-jdbcmysql-adapter", :platforms => :jruby

group :development do
  gem "rdoc", ">= 2.4.2"
  gem "yard"
end

group :test do
  gem "shoulda", "~> 3.3.2"
  gem "mocha", ">= 0.14", :require => 'mocha/api'
  if RUBY_VERSION >= '1.9.3'
    gem "capybara", "~> 2.1.0"
    gem "selenium-webdriver"
  end
end

local_gemfile = File.join(File.dirname(__FILE__), "Gemfile.local")
if File.exists?(local_gemfile)
  puts "Loading Gemfile.local ..." if $DEBUG # `ruby -d` or `bundle -v`
  instance_eval File.read(local_gemfile)
end

# Load plugins' Gemfiles
Dir.glob File.expand_path("../plugins/*/{Gemfile,PluginGemfile}", __FILE__) do |file|
  puts "Loading #{file} ..." if $DEBUG # `ruby -d` or `bundle -v`
  #TODO: switch to "eval_gemfile file" when bundler >= 1.2.0 will be required (rails 4)
  instance_eval File.read(file), file
end
