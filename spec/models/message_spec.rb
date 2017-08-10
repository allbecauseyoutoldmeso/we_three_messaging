require 'rails_helper'

describe Message, type: :model do

  subject(:message) { described_class.new(text: 'hello world') }

  describe '#text' do
    it 'returns the message text' do
      expect(message.text).to eq 'hello world'
    end
  end

end
