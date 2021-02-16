# frozen_string_literal: true

module Cequens
  class Response
    attr_reader :api_response

    def initialize(api_response)
      @api_response = api_response
    end

    def success?
      status_code == 200
    end

    def failure?
      !success?
    end

    def api_response_body
      api_response
    end
  end
end
