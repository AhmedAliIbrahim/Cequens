# frozen_string_literal: true

require 'cequens/version'
require 'cequens/connection'
require 'cequens/errors'
require 'cequens/request'
require 'cequens/response'
require 'cequens/requests/send_sms_request'
require 'cequens/contracts/send_sms_contract'
require 'cequens/requests/get_sms_details_request'
require 'cequens/contracts/get_sms_details_contract'
require 'rails'
require 'byebug'

module Cequens
  class << self
    attr_accessor :access_token

    def config
      yield self
    end

    def send_sms(params, opts = {})
      Request.new('send_sms', params, opts).fire_request
    end

    def get_sms_details(params, opts = {})
      Request.new('get_sms_details', params, opts).fire_request
    end
  end
end
