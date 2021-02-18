# frozen_string_literal: true

module Cequens
  module Requests
    module GetSMSDetailsRequest
      DEFAULTS = {}.freeze

      def fire_request
        cequens_api_response = Connection.get(request[:path], request[:params], request[:body], request[:options])
        response_body = JSON.parse(cequens_api_response.body)

        Response.new(response_body)
      end

      private

      def build_get_sms_details_request
        {
          path: "sms/v1/messages/#{message_id}",
          params: {},
          body: {},
          options: options
        }
      end

      def request_params
        @request_params ||= DEFAULTS.merge(params)
      end

      def message_id
        request_params[:id]
      end

      def validate_params!
        contract = Contracts::GetSMSDetailsContract.new.call(request_params)
        raise InvalidCequensRequestError, contract.errors.to_h if contract.failure?
      end
    end
  end
end
