# frozen_string_literal: true

require 'cequens/version'
require 'cequens/connection'
require 'cequens/errors'
require 'cequens/request'
require 'cequens/response'
require 'cequens/requests/send_sms_request'
require 'cequens/contracts/send_sms_contract'
require 'rails'

module Cequens
  class << self
    attr_accessor :access_token

    def config
      yield self
    end

    def send_sms(params, opts = {})
      Request.new('send_sms', params, opts).fire_request
    end
  end
end
