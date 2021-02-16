# frozen_string_literal: true

require 'dry-validation'
KEYS = [0, 1].freeze
MESSAGE_TYPE = %w[text unicode].freeze

module Cequens
  module Contracts
    class SendSMSContract < Dry::Validation::Contract
      params do
        required(:recipients).value(:string)
        required(:messageText).value(:string)
        required(:senderName).value(:string)
        required(:messageType).value(:string)
        optional(:validityPeriod).value(:string)
        optional(:clientMessageId).value(:integer)
        optional(:acknowledgement).value(:integer)
        optional(:deliveryTime).value(:string)
        optional(:ip).value(:string)
        optional(:dlrUrl).value(:string)
        optional(:dateStamp).value(:integer)
        optional(:udh).value(:string)
        optional(:dataCoding).value(:integer)
        optional(:flashing).value(:integer)
      end
    end
  end
end
