# frozen_string_literal: true

module Cequens
  class Request
    DEFAULT_OPTIONS = {}.freeze

    attr_reader :action, :params, :request, :options

    def initialize(action, params, opts)
      @action = action
      @params = params
      @options = DEFAULT_OPTIONS.merge(opts)

      build_request
    end

    private

    def build_request
      case action
      when 'send_sms'
        self.class.include Requests::SendSMSRequest
        validate_params!
        @request = build_send_sms_request
      when 'get_sms_details'
        self.class.include Requests::GetSMSDetailsRequest
        validate_params!
        @request = build_get_sms_details_request
      end
    end
  end
end
