# frozen_string_literal: true

require 'bundler/setup'
require 'cequens'
require 'webmock/rspec'
require 'support/file_manger'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.include FileManager

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def send_sms_request_params
  {
    "messageText": 'Test from Ahmed',
    "senderName": 'Cequens',
    "recipients": '2011111111'
  }
end

def send_sms_request_all_params
  {
    "messageText": 'Test from Ahmed',
    "senderName": 'Cequens',
    "messageType": 'text',
    "recipients": '2011111111'
  }
end

# rubocop:disable Metrics/MethodLength

def cequens_api_response
  {
    'replyCode' => 0,
    'replyMessage' => 'Request handled successfully',
    'requestId' => 'dd5fa290-6ecf-11eb-a64b-c1de67d616f8',
    'clientRequestId' => 0,
    'requestTime' => '2021-02-14T14:21:01.625',
    'data' => {
      'SentSMSIDs' => [{ "SMSId": 'f6ad03d3-c6ab-435b-98c1-b5079847f367' }],
      'InvalidRecipients' => ''
    }
  }.to_json
end

# rubocop:enable Metrics/MethodLength

def sms_details_request_params
  {
    "id": '1233455'
  }
end
