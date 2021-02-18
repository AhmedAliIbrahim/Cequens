# frozen_string_literal: true

require 'dry-validation'

module Cequens
  module Contracts
    class GetSMSDetailsContract < Dry::Validation::Contract
      params do
        required(:id).value(:string)
      end
    end
  end
end
