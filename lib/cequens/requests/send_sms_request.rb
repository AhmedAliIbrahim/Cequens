# frozen_string_literal: true

module Cequens
  module Requests
    module SendSMSRequest
      DEFAULTS = { messageType: 'text' }.freeze

      def fire_request
        cequens_api_response = Connection.post(request[:path], request[:params], request[:body], request[:options])
        response_body = JSON.parse(cequens_api_response.body)

        Response.new(response_body)
      end

      private

      def build_send_sms_request
        {
          path: 'sms/v1/messages',
          params: {},
          body: request_transformed_params,
          options: options
        }
      end

      def request_params
        @request_params ||= DEFAULTS.merge(params)
      end

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      def request_transformed_params
        {
          messageText: request_params[:messageText],
          senderName: sender_name,
          messageType: request_params[:messageType],
          recipients: request_params[:recipients],
          clientMessageId: request_params[:clientMessageId],
          acknowledgement: request_params[:acknowledgement],
          deliveryTime: request_params[:deliveryTime],
          validityPeriod: request_params[:validityPeriod],
          ip: request_params[:ip],
          dlrUrl: request_params[:dlrUrl],
          dateStamp: request_params[:dateStamp],
          udh: request_params[:udh],
          dataCoding: request_params[:dataCoding],
          flashing: request_params[:flashing]
        }.compact
      end

      def sender_name
        if request_params[:sender_name].nil?
          request_params[:sender_name] =
            Cequens.sender_name
        else
          request_params[:sender_name]
        end
      end

      # rubocop:enable Metrics/AbcSize
      # rubocop:enable Metrics/MethodLength

      def validate_params!
        contract = Contracts::SendSMSContract.new.call(request_params)
        raise InvalidCequensRequestError, contract.errors.to_h if contract.failure?
      end
    end
  end
end
