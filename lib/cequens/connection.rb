# frozen_string_literal: true

require 'faraday'
require 'json'

module Cequens
  class Connection
    CEQUENS_BASE_URL = 'https://apis.cequens.com/'

    class << self
      def post(path, params, body, options)
        conn = options[:sandbox] ? sandbox_connection : connection

        conn.post(path) do |request|
          request.params = params
          request.body = body.to_json
        end
      end

      private

      def connection
        @connection ||= Faraday.new(url: CEQUENS_BASE_URL,
                                    headers: { 'Content-Type': 'application/json',
                                               'Accept': 'application/json' })
      end
    end
  end
end
