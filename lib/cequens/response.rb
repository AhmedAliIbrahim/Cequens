# frozen_string_literal: true

module Cequens
  class Response
    attr_reader :api_response

    def initialize(api_response)
      @api_response = api_response
    end

    def success?
      api_response_body['replyCode'].zero?
    end

    def failure?
      !success?
    end

    def api_response_body
      api_response
    end

    def message
      api_response_body['replyMessage']
    end
  end
end
