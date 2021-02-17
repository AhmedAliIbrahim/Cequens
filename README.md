# Cequens

**Disclaimer:** we are not officially affilated with the Cequens company.

A plug-and-play library that make it easier to use with Cequens SMS APIs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cequens'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cequens

## Usage

configure access token as:

    $ rails g cequens:config

    Cequens.config do |c|
    # c.access_token = token # add your access token
    end

### Send SMS

```ruby
params = {
    "messageText": 'Test from Ahmed',
    "senderName": 'Cequens',
    "messageType": 'text',
    "recipients": '2011111111'
  }

res = Cequens.send_sms(params)
#  => #<Cequens::Response:0x00007ffd672b29f8 @api_response={"replyCode"=>0, "replyMessage"=>"Request handled successfully", "requestId"=>"64035880-7044-11eb-9f04-11a5522e89a7", "clientRequestId"=>0, "requestTime"=>"2021-02-16T10:47:40.296", "data"=>{"SentSMSIDs"=>[{"SMSId"=>"056ef72a-1497-47be-a4c8-4a7835e071dc"}], "InvalidRecipients"=>""}}>

res.success? # => true
```
