# frozen_string_literal: true

require 'bundler/setup'
require 'cequens'
require 'webmock/rspec'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def send_sms_request_params
  {
    "recipients": '201112018697',
    "messageText": 'Test from Ahmed',
    "senderName": 'Cequens',
    "messageType": 'text'
  }
end
