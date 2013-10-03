require 'rubygems'
require 'bundler/setup'

require 'delayed_job'

#require 'lib/nppes/tasks/nppes.rake'


#require 'active_support/all'
#require 'action_mailer'
#require 'action_mailer_x509'
#require 'action_mailer_x509/x509'
#require 'action_mailer_x509/security_object'
#require 'action_mailer_x509/configuration'
#require 'models/notifier'
#require 'default_data'

RSpec.configure do |config|
  config.after(:each) do
    Delayed::Worker.reset
  end
end