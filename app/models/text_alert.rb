require 'twilio-ruby'

class TextAlert

  attr_reader :message_user, :message_text, :twilio_sid, :twilio_token, :twilio_number

  def initialize(message_user, message_text)
    @message_user = message_user
    @message_text = message_text
    @twilio_sid = ENV['TWILIO_SID']
    @twilio_token = ENV['TWILIO_TOKEN']
    @twilio_number = ENV['TWILIO_NUMBER']
  end

  def send_texts
    client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    # User.where.not(id: message_user.id).pluck(:mobile).each do |mobile|
    User.pluck(:mobile).each do |mobile|
      client.api.account.messages.create(
        from: twilio_number,
        to: mobile,
        body: text_content
      )
    end
  end

  def text_content
    "#{message_user.email} posted a new message on we_three: #{message_text}\nto reply go to https://we-three.herokuapp.com"
  end

end
