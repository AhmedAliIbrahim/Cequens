# frozen_string_literal: true

RSpec.describe Cequens::Request do
  context 'send sms request' do
    describe '.new' do
      it 'builds the correct send sms request' do
        cequens_request = described_class.new('send_sms', send_sms_request_params, {})
        expect(cequens_request.class.included_modules.include?(Cequens::Requests::SendSMSRequest)).to be true
        expect(cequens_request.action).to eq('send_sms')
        expect(cequens_request.request[:path]).to eq('sms/v1/messages')
        expect(cequens_request.request[:body].keys).to eq(send_sms_request_all_params.keys)
      end
    end
    describe '#fire' do
      it 'a send message request' do
        stub_request(:post, "#{Cequens::Connection::CEQUENS_BASE_URL}sms/v1/messages")
          .with(body: send_sms_request_all_params)
          .to_return(status: 200, body: cequens_api_response)
        described_class.new('send_sms', send_sms_request_all_params, {}).fire_request

        expect(WebMock).to have_requested(:post, "#{Cequens::Connection::CEQUENS_BASE_URL}sms/v1/messages")
          .with(body: send_sms_request_all_params)
      end
    end
  end

  context 'get sms details request' do
    describe '.new' do
      it 'builds the correct get sms details request' do
        cequens_request = described_class.new('get_sms_details', sms_details_request_params, {})
        expect(cequens_request.class.included_modules.include?(Cequens::Requests::GetSMSDetailsRequest)).to be true
        expect(cequens_request.action).to eq('get_sms_details')
        expect(cequens_request.request[:path]).to eq("sms/v1/messages/#{sms_details_request_params[:id]}")
      end
    end
    describe '#fire' do
      let(:url) { "#{Cequens::Connection::CEQUENS_BASE_URL}sms/v1/messages/#{sms_details_request_params[:id]}" }
      it 'a send message request' do
        stub_request(:get, url)
          .to_return(status: 200, body: cequens_api_response)
        described_class.new('get_sms_details', sms_details_request_params, {}).fire_request

        expect(WebMock).to have_requested(:get, url)
      end
    end
  end
end
