# frozen_string_literal: true

require 'faraday'
require 'json'

module Cequens
  class Connection
    CEQUENS_BASE_URL = 'https://apis.cequens.com/'

    class << self
      def get(path, _params, _body, _options)
        connection.get(path)
      end

      def post(path, params, body, _options)
        connection.post(path) do |request|
          request.params = params
          request.body = body.to_json
        end
      end

      private

      def connection
        @connection ||= Faraday.new(url: CEQUENS_BASE_URL,
                                    headers: { 'Content-Type': 'application/json',
                                               'Accept': 'application/json',
                                               'Authorization': "Bearer #{Cequens.access_token}" })
      end
    end
  end
end
